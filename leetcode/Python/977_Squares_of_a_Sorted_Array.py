class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        result = []

        if not nums:
            return []

        for n in nums:
            result.append(n**2)
        result.sort()
        return result
        