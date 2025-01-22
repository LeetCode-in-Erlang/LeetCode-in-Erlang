% #Medium #Top_100_Liked_Questions #String #Dynamic_Programming
% #Algorithm_II_Day_17_Dynamic_Programming #Dynamic_Programming_I_Day_19
% #Udemy_Dynamic_Programming #Big_O_Time_O(n*m)_Space_O(n*m)
% #2025_01_22_Time_100_ms_(100.00%)_Space_100.0_MB_(100.00%)

-spec longest_common_subsequence(Text1 :: unicode:unicode_binary(), Text2 :: unicode:unicode_binary()) -> integer().
longest_common_subsequence(Text1, Text2) ->
    T1 = binary_to_list(Text1),
    T2 = binary_to_list(Text2),
    lcs(T1, T2, length(T1), length(T2)).

lcs(_, _, 0, _) -> 0;
lcs(_, _, _, 0) -> 0;
lcs([H|T1], [H|T2], M, N) ->
    1 + lcs(T1, T2, M-1, N-1);
lcs([H1|T1], [H2|T2], M, N) ->
    max(lcs(T1, [H2|T2], M-1, N), lcs([H1|T1], T2, M, N-1)).
