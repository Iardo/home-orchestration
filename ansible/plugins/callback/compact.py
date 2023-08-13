# GNU General Public License v3.0+
# (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

# Make coding more python3-ish
from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

import json
from ansible import constants as C
from ansible.plugins.callback import CallbackBase
from ansible.utils.color import stringc
from ansible.utils.fqcn import add_internal_fqcns
from pprint import pprint

class CallbackModule(CallbackBase):
    CALLBACK_VERSION = 2.0
    CALLBACK_NAME = "compact"
    CALLBACK_TYPE = "stdout"

    def __init__(self):
        self._play = None
        self._last_task_banner = None
        self._last_task_name = None
        self._last_host_name = None
        self._task_type_cache = {}
        super(CallbackModule, self).__init__()

    def _print_task_banner(self, task):
        self._last_task_banner = task._uuid
        task_name = self._last_task_name
        formatted = "\t{}".format(task_name).expandtabs(2)
        print(formatted, end="")


    def v2_playbook_on_play_start(self, play):
        name = play.get_name().strip()
        self._play = play
        # self._display.display("\n{}".format(name))
        print("\n{}".format(name))

    def v2_playbook_on_task_start(self, task, is_conditional):
        task_name = task._attributes.get("name").strip()
        task_action = task._attributes.get("action")
        is_subtask = task._attributes.get('vars').get('subtask')
        is_nameskip = task._attributes.get('vars').get('nameskip')

        has_task_name = None
        if hasattr(task, '_ds'):
          has_task_name = "name" in task._ds

        if has_task_name and task_name != task_action and is_subtask and is_nameskip is not True:
            self._last_task_name = task_name
            print("\r\t└── {}".format(task_name).expandtabs(5), end="")
            return

        if has_task_name and task_name and is_nameskip is not True:
            self._last_task_name = task_name
            print("\t├── {}".format(task_name).expandtabs(2), end="")

    # def v2_playbook_on_no_hosts_matched(self):
    #     self._display.display("skipping: no hosts matched", color=C.COLOR_SKIP)

    # def v2_playbook_on_no_hosts_remaining(self):
    #     self._display.banner("NO MORE HOSTS LEFT")

    def v2_playbook_on_stats(self, stats):
        print("\n---------------------------------------------")
        hosts = sorted(stats.processed.keys())
        for host in hosts:
            stat = stats.summarize(host)

            stat_ok = " OK: {}".format(stat["ok"]) if stat["ok"] > 0 else None
            stat_changed = " | CHANGED: {}".format(stat["changed"]) if stat["changed"] > 0 else None
            stat_failures = " | FAILED: {}".format(stat["failures"]) if stat["failures"] > 0 else None
            stat_unreachable = " | UNREACHABLE: {}".format(stat["unreachable"]) if stat["unreachable"] > 0 else None
            stat_skipped = " | SKIPPED: {}".format(stat["skipped"]) if stat["skipped"] > 0 else None
            stat_rescued = " | RESCUED: {}".format(stat["rescued"]) if stat["rescued"] > 0 else None
            stat_ignored = " | IGNORED: {}".format(stat["ignored"]) if stat["ignored"] > 0 else None

            print("[{}]".format(stringc(host, color=C.COLOR_OK)), end="")
            if stat_ok:
              print("{}".format(stringc(stat_ok, color=C.COLOR_OK)), end="")
            if stat_changed:
              print("{}".format(stringc(stat_changed, color=C.COLOR_CHANGED)), end="")
            if stat_failures:
              print("{}".format(stringc(stat_failures, color=C.COLOR_ERROR)), end="")
            if stat_unreachable:
              print("{}".format(stringc(stat_unreachable, color="normal")), end="")
            if stat_skipped:
              print("{}".format(stringc(stat_skipped, color="normal")), end="")
            if stat_rescued:
              print("{}".format(stringc(stat_rescued, color="normal")), end="")
            if stat_ignored:
              print("{}".format(stringc(stat_ignored, color="normal")), end="")
            print("\n")

    def v2_runner_on_start(self, host, task):
        if self._last_host_name != host:
          print(stringc("[{}]".format(host).strip(), color=C.COLOR_OK))
        self._last_host_name = host

    def v2_runner_on_ok(self, result):
        self._clean_results(result._result, result._task.action)
        # self._handle_warnings(result._result)

        is_nameskip = result._task_fields.get('vars').get('nameskip')
        task_has_msg = result._task_fields.get("args").get("msg")
        task_name = result._task_fields.get("name")
        task_action = result._task_fields.get("action")
        task_ignore = [
           'gather_facts',
           'ansible.builtin.include_tasks',
        ]

        if result._result.get("changed", False):
            state = "CHANGED"
            color = C.COLOR_CHANGED
        else:
            state = "OK"
            color = C.COLOR_OK

        if task_action == "debug" and task_has_msg:
            formatted = "... {}\n".format(state)
            print(stringc(formatted, color=color), end="")
            print("\r\t".expandtabs(4), end="")
            print(self._dump_results(result._result, indent=6))
            return
        
        if task_name and task_action not in task_ignore and is_nameskip is not True:
            formatted = "... {}\n".format(state)
            print(stringc(formatted, color=color), end="")

    def v2_runner_on_skipped(self, result, ignore=False):
        task_name = result._task_fields.get("name").strip()
        task_action = result._task_fields.get("action")
        is_subtask = result._task_fields.get('vars').get('subtask')
        is_nameskip = result._task_fields.get('vars').get('nameskip')

        if ignore is True:
          return

        if task_name and task_name != task_action and is_subtask and is_nameskip is not True:
            print("\r\t└── {}".format(task_name).expandtabs(5), end="")
            self._display.display("... SKIPPED", color=C.COLOR_SKIP)
            return

        if task_name and is_nameskip is not True:
            print("\r\t├── {}".format(task_name).expandtabs(2), end="")
            self._display.display("... SKIPPED", color=C.COLOR_SKIP)

    def v2_runner_on_unreachable(self, result):
        self._display.display("%s | UNREACHABLE! => %s" % (result._host.get_name(), self._dump_results(result._result, indent=4)), color=C.COLOR_UNREACHABLE)

    def v2_runner_on_failed(self, result, ignore_errors=False):
        if ignore_errors:
            print(stringc("... IGNORED", color=C.COLOR_SKIP))
            return

        print(stringc("... ERROR", color=C.COLOR_ERROR))
        if result._result.get("module_stderr"):
            print("\t\t└──[{}]".format(result._result.get("module_stderr").strip()).expandtabs(4))
        else:
            pprint(result._result)

    def v2_on_file_diff(self, result):
        if "diff" in result._result and result._result["diff"]:
            self._display.display(self._get_diff(result._result["diff"]))
