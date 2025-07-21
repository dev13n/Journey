import pandas as pd

def find_classes(courses: pd.DataFrame) -> pd.DataFrame:
    result = courses.copy()
    result = result.groupby('class')['class'].count().reset_index(name='test')
    return result[result['test']>=5][['class']]