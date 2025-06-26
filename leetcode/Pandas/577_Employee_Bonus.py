import pandas as pd

def employee_bonus(employee: pd.DataFrame, bonus: pd.DataFrame) -> pd.DataFrame:
    result = pd.merge(employee, bonus, how='left', left_on='empId', right_on='empId')
    return result[(result['bonus']<1000) | (result['bonus'].isnull())][['name', 'bonus']]
    