class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        
        if not grid:
            return 0

        visit = set()
        result = 0

        def bfs(r,c):
            q = deque()
            visit.add((r,c))
            q.append((r,c))
            while q:
                row, col = q.popleft()
                directions = [[1,0],[-1,0],[0,1],[0,-1]]

                for dr, dc in directions:
                    r, c = row+dr, col+dc
                    if r in range(len(grid)) and c in range(len(grid[0])) and grid[r][c] =='1' and (r,c) not in visit:
                            q.append((r,c))
                            visit.add((r,c))


        for r in range (len(grid)):
            for c in range (len(grid[0])):
                if grid[r][c] == '1' and (r,c) not in visit:
                    bfs(r,c)
                    result += 1

        return result
        