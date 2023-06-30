from asp_wrapper import *

with open("abilities-desires-relaxed.lp", 'r') as file:
    logic = file.read()

def show_case(conf):
    case = "-holds(m_x). nodes(m_x)." + conf
    answer_sets = solve(logic + case)
    for answer_set in answer_sets:
        print(answer_set)

print("------ Example: freedom to marry ------")
print("==== Nobody has any power")
show_case("")
print("==== agent x has the power to marry x")
show_case("holds(poscauses(e_x, m_x)).")
print("==== authority a has the power to enable agent x to marry")
show_case("holds(poscauses(a_m, poscauses(e_x, m_x))).")
print("==== agent x and y have the power to marry x")
show_case("holds(poscauses(e_x, m_x)). holds(poscauses(e_y, m_x)).")
print("==== agent x and y have the power to inhibit the marrying of x")
show_case("holds(negcauses(e_x, m_x)). holds(negcauses(e_y, m_x)).")
print("==== agent x has the power to marry. agent z has the power to inhibit the power of marrying of x.")
show_case("holds(poscauses(e_x, m_x)). holds(poscauses(z, neg(poscauses(e_x, m_x)))).")
