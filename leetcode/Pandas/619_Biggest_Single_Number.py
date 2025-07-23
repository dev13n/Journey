import pandas as pd

def biggest_single_number(my_numbers: pd.DataFrame) -> pd.DataFrame:
    result = my_numbers.copy()
    result = result.groupby('num')['num'].count().reset_index(name='count')
    result = result[result['count'] < 2]
    
    if result.empty:
        return pd.DataFrame([{'num': None}], columns=['num'])
    
    result = result.sort_values('num', ascending=False)
    result_value = result.iloc[0, 0]
    
    return pd.DataFrame([result_value], columns=['num'])
