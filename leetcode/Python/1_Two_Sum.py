class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        hash_map = dict()
        result = list()
        for i in range(len(nums)):
            check_target = target - nums[i]
            if check_target in hash_map:
                result.append(i)
                result.append(hash_map[check_target])
                break
            else:
                hash_map[nums[i]] = i
        return result
        