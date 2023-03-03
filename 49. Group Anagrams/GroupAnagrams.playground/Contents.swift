// https://leetcode.com/problems/group-anagrams

func groupAnagrams(_ strs: [String]) -> [[String]] {
    guard strs.count > 0 else { return [] }
    
    var dict = [[Character: Int]: [String]]()
    for str in strs {
        var letterDict = [Character: Int]()
        for c in str {
            letterDict[c, default: 0] += 1
        }
        dict[letterDict, default: []].append(str)
    }
    return Array(dict.values)
}

// expect: [["bat"], ["eat", "tea", "ate"], ["tan", "nat"]]
print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
