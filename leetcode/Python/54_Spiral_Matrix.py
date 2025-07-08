class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        result = []
        while matrix:
            # TOP
            result.extend(matrix.pop(0))
            
            # RIGHT COLUMN
            if matrix and matrix[0]:
                for i in matrix:
                    result.append(i.pop(len(i)-1))
            
            # BOTTOM
            if matrix:
                result.extend(matrix.pop(len(matrix)-1)[::-1])
            
            # LEFT COLUMN
            if matrix and matrix[0]:
                for i in matrix[::-1]:
                    result.append(i.pop(0))

        return result
