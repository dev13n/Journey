import pandas as pd

def sales_analysis(sales: pd.DataFrame) -> pd.DataFrame:
    filter=sales.groupby('product_id')[['year']].min().reset_index()
    result=pd.merge(sales,filter, on='product_id')
    result=result[result.year_x==result.year_y][['product_id','year_x','quantity','price']].rename(columns={'year_x':'first_year'})
    return result
    