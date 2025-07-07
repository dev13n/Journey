import pandas as pd

def immediate_food_delivery(delivery: pd.DataFrame) -> pd.DataFrame:
    df_temp = delivery.sort_values(['customer_id','order_date'],ascending=[True,True])
    df_group = df_temp.groupby(["customer_id"]).head(1)
    immediate_percentage = len(df_group[df_group["order_date"] == df_group["customer_pref_delivery_date"]]) / len(df_group)
    return pd.DataFrame({"immediate_percentage":[round(immediate_percentage * 100,2)]})