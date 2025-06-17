import pandas as pd

def find_customer_referee(customer: pd.DataFrame) -> pd.DataFrame:
    result = customer[customer["referee_id"].isnull() | (customer["referee_id"]!=2)][["name"]]
    return result
    