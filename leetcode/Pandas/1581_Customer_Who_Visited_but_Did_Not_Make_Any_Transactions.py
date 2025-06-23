import pandas as pd

def find_customers(visits: pd.DataFrame, transactions: pd.DataFrame) -> pd.DataFrame:
    result = pd.merge(visits, transactions, how='left', left_on='visit_id', right_on='visit_id')
    result = result[pd.isna(result['transaction_id'])]
    result = result.groupby('customer_id', as_index=False).count()
    result = result.rename(columns={'visit_id':'count_no_trans'})
    return result[['customer_id', 'count_no_trans']]
    