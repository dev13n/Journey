import pandas as pd

def article_views(views: pd.DataFrame) -> pd.DataFrame:
    result = views[views["author_id"]==views["viewer_id"]][["author_id"]].sort_values(["author_id"], ascending=True).drop_duplicates()
    return result.rename(columns={"author_id":"id"})
    