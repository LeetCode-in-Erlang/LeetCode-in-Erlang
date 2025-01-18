% #Medium #Top_100_Liked_Questions #Depth_First_Search #Breadth_First_Search #Tree #Binary_Tree
% #Data_Structure_II_Day_16_Tree #Level_2_Day_15_Tree
% #2025_01_18_Time_0_(100.00%)_Space_62.64_(100.00%)

%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

%% @spec right_side_view(Root :: #tree_node{} | null) -> [integer()].
-spec right_side_view(Root :: #tree_node{} | null) -> [integer()].
right_side_view(null) ->
    [];
right_side_view(Root) ->
    right_side_view_level([Root], []).

%% Helper function to traverse the tree level by level
-spec right_side_view_level(Level :: [#tree_node{}], Acc :: [integer()]) -> [integer()].
right_side_view_level([], Acc) ->
    lists:reverse(Acc);
right_side_view_level(Level, Acc) ->
    % Get the value of the rightmost node at this level
    RightmostValue = lists:last([Node#tree_node.val || Node <- Level]),
    % Accumulate the rightmost value
    NewAcc = [RightmostValue | Acc],
    % Prepare the next level
    NextLevel = lists:foldl(fun(Node, AccNextLevel) ->
        case Node of
            #tree_node{left = null, right = null} -> AccNextLevel;
            #tree_node{left = Left, right = Right} ->
                AccNextLevel ++ lists:filter(fun(X) -> X =/= null end, [Left, Right])
        end
    end, [], Level),
    % Recursive call to process the next level
    right_side_view_level(NextLevel, NewAcc).
