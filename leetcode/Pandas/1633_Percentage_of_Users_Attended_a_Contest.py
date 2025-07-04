import pandas as pd

def users_percentage(users: pd.DataFrame, register: pd.DataFrame) -> pd.DataFrame:
    result = pd.merge(users, register, how='left', left_on='user_id', right_on='user_id', suffixes=['_x', '_y'])
    nuni = result['user_id'].nunique()
    result = result.groupby('contest_id')['user_id'].count().reset_index()
    result['percentage'] = ((result['user_id']/nuni) * 100).round(2)
    result = result[result['contest_id'].notna()]
    result = result.sort_values(['percentage', 'contest_id'], ascending=[False, True])
    return result[['contest_id', 'percentage']]
    