import pandas as pd

def queries_stats(queries: pd.DataFrame) -> pd.DataFrame:
    result = queries.copy()
    result['quality'] = result['rating'] / result['position'] + 1e-6
    result['poor_query_percentage'] = np.where(result['rating'] < 3, 1, 0)
    result_grouped = result.groupby('query_name').agg(
        quality=('quality', 'mean'),
        poor_query_percentage=('poor_query_percentage', 'mean')
    ).reset_index()
    result_grouped['poor_query_percentage'] *= 100
    return result_grouped.round(2)
