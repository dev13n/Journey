import pandas as pd

def user_activity(activity: pd.DataFrame) -> pd.DataFrame:
    result = activity.copy()
    result['activity_date'] = pd.to_datetime(result['activity_date'])
    end_date = pd.to_datetime('2019-07-27')
    start_date = end_date - pd.Timedelta(days=29)
    result = result[(result['activity_date'] >= start_date) & (result['activity_date'] <= end_date)]
    result = result.groupby('activity_date')['user_id'].nunique().reset_index()
    result.rename(columns={'user_id': 'active_users'}, inplace=True)
    return result.rename(columns={'activity_date':'day'})
