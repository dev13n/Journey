import pandas as pd

def count_followers(followers: pd.DataFrame) -> pd.DataFrame:
    result = followers.copy()
    result = result.groupby('user_id')['follower_id'].count().reset_index()
    result.sort_values(by='user_id', ascending=True)
    return result.rename(columns={'follower_id':'followers_count'})
    