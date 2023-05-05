// https://leetcode.com/problems/word-search/description/

class Solution {
    static func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0, word.count > 0, word.count <= board.count * board[0].count else { return false }
        
        let rows = board.count
        let columns = board[0].count
        
        for r in 0..<rows {
            for c in 0..<columns {
                if board[r][c] == word.first! {
                    let word = Array(word)
                    let progress = [Character]()
                    var isWord = false
                    let index = 0
                    dfs(board: board, word: word, row: r, column: c, progress: progress, index: index, isWord: &isWord)
                    if isWord { return true }
                }
            }
        }
        
        return false
    }
    
    static func dfs(board: [[Character]], word: [Character], row: Int, column: Int, progress:  [Character], index: Int, isWord: inout Bool) {
        if word.count == progress.count {
            isWord = true
            return
        }
        
        guard row >= 0, row < board.count, column >= 0, column < board[0].count else { return }
        
        if word[index] != board[row][column] {
            return
        }
        
        var board = board
        var progress = progress
        progress.append(board[row][column])
        board[row][column] = "0"
                
        dfs(board: board, word: word, row: row + 1, column: column, progress: progress, index: index + 1, isWord: &isWord)
        dfs(board: board, word: word, row: row, column: column - 1, progress: progress, index: index + 1, isWord: &isWord)
        dfs(board: board, word: word, row: row - 1, column: column, progress: progress, index: index + 1, isWord: &isWord)
        dfs(board: board, word: word, row: row, column: column + 1, progress: progress, index: index + 1, isWord: &isWord)
    }
}

print(Solution.exist([["a","a","a","a"],["a","a","a","a"],["a","a","a","a"]], "aaaaaaaaaaab")) // expect: false

print(Solution.exist([["A","B","C","E"],["S","F","E","S"],["A","D","E","E"]], "ABCESEEEFS")) // expect: true
print(Solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED")) // expect: true
print(Solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE")) // expect: true
print(Solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB")) // expect: false
