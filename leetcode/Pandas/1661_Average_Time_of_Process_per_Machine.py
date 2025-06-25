import pandas as pd

def get_average_time(activity: pd.DataFrame) -> pd.DataFrame:
    result = pd.merge(activity, activity, how='inner', left_on=['machine_id', 'process_id'], right_on=['machine_id', 'process_id'], suffixes=('_a1', '_a2'))
    result = result[(result['activity_type_a1']=='start')&(result['activity_type_a2']=='end')]
    result['diff'] = result['timestamp_a2'] - result['timestamp_a1']
    result = result.groupby('machine_id').mean('diff').reset_index()
    result['diff'] = result['diff'].round(3)
    result = result.rename(columns={"diff":"processing_time"})
    return result[['machine_id', 'processing_time']]