% Smart Traffic Signal Controller
% Rule-based selection of the next road to receive a GREEN signal.


% road(Name, Vehicles, WaitingMinutes, EmergencyPresent).
road(a, 15, 5, no).
road(b, 8, 12, yes).
road(c, 25, 3, no).
road(d, 5, 7, no).


% Priority score for roads without emergency vehicles:
% Score = (vehicle count * 2) + waiting time.
score(Name, Vehicles, Waiting, no, 0, Total) :-
    Total is (Vehicles * 2) + Waiting.

% Emergency presence is the top priority category.
score(Name, Vehicles, Waiting, yes, 1, Total) :-
    Total is Waiting * 1000 + Vehicles.


road_score(Name, Score, EmergencyRank, Waiting, Vehicles) :-
    road(Name, Vehicles, Waiting, Emergency),
    score(Name, Vehicles, Waiting, Emergency, EmergencyRank, Score).


% Compare roads by emergency rank, then score, then waiting time.etter(road_score(Name1, Rank1, Score1, Wait1, Veh1),
       road_score(Name2, Rank2, Score2, Wait2, Veh2)) :-
    ( Rank1 > Rank2
    ; Rank1 =:= Rank2, Score1 > Score2
    ; Rank1 =:= Rank2, Score1 =:= Score2, Wait1 > Wait2
    ; Rank1 =:= Rank2, Score1 =:= Score2, Wait1 =:= Wait2, Name1 @< Name2
    ).

road_candidate(Name, Candidate) :-
    road(Name, Vehicles, Waiting, Emergency),
    score(Name, Vehicles, Waiting, Emergency, Rank, Score),
    Candidate = road_score(Name, Rank, Score, Waiting, Vehicles).


% Collect candidates and select the highest-priority road.est_road(Selected) :-
    findall(Candidate, road_candidate(_, Candidate), Candidates),
    select_best(Candidates, Selected).


select_best([Best], Best).
select_best([Current, Next | Rest], Best) :-
    ( better(Current, Next) -> Winner = Current ; Winner = Next ),
    select_best([Winner | Rest], Best).


reason(Name, Reason) :-
    road(Name, _, _, yes),
    !,
    format(atom(Reason), 'An emergency vehicle is waiting on Road ~w. Emergency vehicles have the highest priority.', [Name]).
reason(Name, Reason) :-
    road(Name, Vehicles, Waiting, no),
    score(Name, Vehicles, Waiting, no, _, Score),
    format(atom(Reason), 'Road ~w has the highest non-emergency priority score (~w), based on vehicle count and waiting time.', [Name, Score]).

main :-
    best_road(road_score(Name, _, _, _, _)),
    upcase_atom(Name, RoadLetter),
    reason(Name, Explanation),
    nl,
    writeln('SMART TRAFFIC SIGNAL CONTROLLER'),
    format('Selected Road: Road ~w~n', [RoadLetter]),
    writeln('Signal: GREEN'),
    nl,
    writeln('Reason:'),
    writeln(Explanation),
    nl.
