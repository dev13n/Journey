import pandas as pd

def confirmation_rate(signups: pd.DataFrame, confirmations: pd.DataFrame) -> pd.DataFrame:
    result = pd.merge(signups, confirmations, how='left', on='user_id', suffixes=['_x','_y'])
    result['confirmation_rate']=np.where((result['action']=='timeout') | (result['action'].isna()), 0, 1)
    result = result.groupby(['user_id'])['confirmation_rate'].mean().round(2).reset_index()
    return result
    