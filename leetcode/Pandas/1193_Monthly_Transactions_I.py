import pandas as pd

def monthly_transactions(transactions: pd.DataFrame) -> pd.DataFrame:
    result = transactions.copy()
    result['trans_date'] = pd.to_datetime(result['trans_date'])
    result['month'] = result['trans_date'].dt.strftime('%Y-%m')
    result = result.groupby(['month', 'country'], dropna=False).agg(
        trans_count=('id', 'size'),
        approved_count=('state', lambda x: (x == 'approved').sum()),
        trans_total_amount=('amount', 'sum'),
        approved_total_amount=('amount', lambda x: x[result['state'] == 'approved'].sum())
    ).reset_index()

    return result
# df['trans_date_plus_5'] = df['trans_date'] + pd.to_timedelta(5, unit='D')