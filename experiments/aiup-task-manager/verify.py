from pathlib import Path
import sys
from rdflib import Graph, Namespace, RDF

ROOT = Path(__file__).resolve().parent
ATM = Namespace("https://raw.githubusercontent.com/GerhardBalz/semantic-knowledge-engineering/main/experiments/aiup-task-manager/model.ttl#")

ALLOWED_STATUSES = {ATM.Draft, ATM.Open, ATM.Assigned, ATM.Done}


def parse(name: str) -> Graph:
    graph = Graph()
    graph.parse(ROOT / name, format="turtle")
    return graph


def validate(data: Graph):
    failures = []

    for task in data.subjects(RDF.type, ATM.Task):
        teams = list(data.objects(task, ATM.ownedByTeam))
        statuses = list(data.objects(task, ATM.status))
        if len(teams) != 1:
            failures.append(f"{task}: expected exactly one owning team")
        if len(statuses) != 1:
            failures.append(f"{task}: expected exactly one status")
        elif statuses[0] not in ALLOWED_STATUSES:
            failures.append(f"{task}: invalid task status")

    for access in data.subjects(RDF.type, ATM.TaskAccess):
        viewers = list(data.objects(access, ATM.viewer))
        tasks = list(data.objects(access, ATM.task))
        if len(viewers) != 1:
            failures.append(f"{access}: expected exactly one viewer")
            continue
        if len(tasks) != 1:
            failures.append(f"{access}: expected exactly one task")
            continue

        viewer = viewers[0]
        task = tasks[0]
        teams = list(data.objects(task, ATM.ownedByTeam))
        if len(teams) == 1 and (viewer, ATM.memberOf, teams[0]) not in data:
            failures.append(f"{access}: viewer is not a member of the task's owning team")

    return failures


def main() -> int:
    # Syntax/provenance artifacts must parse even though this script is not a general SHACL engine.
    parse("model.ttl")
    parse("shapes.ttl")

    valid_failures = validate(parse("data-valid.ttl"))
    invalid_failures = validate(parse("data-invalid.ttl"))

    if valid_failures:
        print("valid: FAIL")
        for failure in valid_failures:
            print(f"- {failure}")
        return 1

    print("valid: PASS")

    expected_markers = ("invalid task status", "viewer is not a member")
    if not all(any(marker in failure for failure in invalid_failures) for marker in expected_markers):
        print("invalid: FAIL (expected violations were not both detected)")
        for failure in invalid_failures:
            print(f"- {failure}")
        return 1

    print("invalid: EXPECTED FAIL")
    for failure in invalid_failures:
        print(f"- {failure}")

    print("experiment: PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())
