from asp_wrapper import *

def reasoning_with_case(case, answers_to_hide = ()):
    with open("abilities-desire.lp", 'r') as file:
        logic = file.read()
    answer_sets = solve(logic + case)
    for answer_set in answer_sets:
        if str(answer_set) not in answers_to_hide:
           print(answer_set)

def relaxed_reasoning_with_case(case, predicate_to_hide = ()):
    with open("abilities-desires-relaxed.lp", 'r') as file:
        logic = file.read()
    answer_sets = solve(logic + case)
    for answer_set in answer_sets:
        output = ""
        for predicate in answer_set:
            if str(predicate) not in predicate_to_hide:
                output += str(predicate) + ", "
        print(output)

base = "-holds(m_x). nodes(m_x)."
predicates_to_hide = ["-holds(m_x)", "nodes(m_x)", "-negdes(m_x)", "-posdes(m_x)", "condition(m_x)"]
print("------ Example: freedom to marry ------")
print(base)
print("==> x is not married. x is free to marry.")
print("==== nobody has any power")
relaxed_reasoning_with_case(base + "", predicates_to_hide)
print("==> nothing can be done.")
print("==== authority a has the power to enable agent x to marry")
relaxed_reasoning_with_case(base + "holds(poscauses(a_m, poscauses(e_x, m_x))).", predicates_to_hide)
print("==> the authority should enact that power.")
print("==== agent x and y have the power to marry x")
relaxed_reasoning_with_case(base + "holds(poscauses(e_x, m_x)). holds(poscauses(e_y, m_x)).", predicates_to_hide)
print("==> they're both prohibited to do it.")
print("==== agent x and y have the power to inhibit the marrying of x")
relaxed_reasoning_with_case(base + "holds(negcauses(e_x, m_x)). holds(negcauses(e_y, m_x)).", predicates_to_hide)
print("==> they're both prohibited to use it.")
