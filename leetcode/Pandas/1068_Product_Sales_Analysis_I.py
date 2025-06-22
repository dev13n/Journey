import pandas as pd

def sales_analysis(sales: pd.DataFrame, product: pd.DataFrame) -> pd.DataFrame:
    result = pd.merge(sales, product, how="left", left_on='product_id', right_on='product_id')
    return result[['product_name', 'year', 'price']]
    