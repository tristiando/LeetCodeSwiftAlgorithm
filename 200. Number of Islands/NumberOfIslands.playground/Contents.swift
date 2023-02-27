// https://leetcode.com/problems/number-of-islands/description/

func numIslands(_ grid: [[Character]]) -> Int {
    let (rows, columns) = (grid.count, grid[0].count)
    var visited = Array(repeating: Array(repeating: false, count: columns), count: rows)
    var count = 0
    
    func dfs(_ r: Int, _ c: Int) {
        guard r >= 0, c >= 0, r < rows, c < columns, grid[r][c] == "1", visited[r][c] == false else { return }
        
        visited[r][c] = true
        dfs(r - 1, c)
        dfs(r + 1, c)
        dfs(r, c - 1)
        dfs(r, c + 1)
    }
    
    for r in 0..<rows {
        for c in 0..<columns {
            if grid[r][c] == "1" && visited[r][c] == false {
                count += 1
                dfs(r, c)
            }
        }
    }
    return count
}

// expect: 3
print(numIslands([
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
  ]
))
