% in database - facts

tweep(jill). % jill is a tweep, a fact
tweep(eric).
tweep(jose).
tweep(joe).
tweep(anna).

tweet(gossip).
tweet(policy).
tweet(declaration).
tweet(greeting).
tweet(screed). % screed is a tweet

tweets(jill, greeting).
tweets(anna, gossip).

follows(eric, jill).
follows(joe, anna).
follows(eric, joe).
follows(jill, joe).

fan(joe, anna).
fan(eric, joe).

receives(Tweep, What) :-
    tweets(Tweep, What);
    says(Who, What),
    follows(Tweep, Who).

retweets(Fan, What) :-
    tweets(Star, What),
    fan(Fan, Star).

says(Tweep, What) :-
    tweets(Tweep, What);
    retweets(Tweep, What).

/*
    - Prolog only knows jill is different from eric, jose, joe, and anna
    - Jill is an atom. It is a constant. It is a value.
    - Expression tweet(greeting) is a fact

    - Variables starts with an uppercase letter

    - rules are generic
*/

