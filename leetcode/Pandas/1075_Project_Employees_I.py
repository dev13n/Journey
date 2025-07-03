import pandas as pd

def project_employees_i(project: pd.DataFrame, employee: pd.DataFrame) -> pd.DataFrame:
    result = pd.merge(project, employee, how='left', on='employee_id', suffixes=['_x', '_y'])
    result = result.groupby('project_id')['experience_years'].mean().reset_index().round(2)
    result = result.rename(columns={'experience_years':'average_years'})
    return result
    