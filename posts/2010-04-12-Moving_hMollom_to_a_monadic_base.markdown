-----
title:  Moving hMollom to a monadic base
author: Andy Georges
date: April 12, 2010
description: 
tags: 
-----







In a move to finally grok monads and monad stack a bit better, I decided
to move the hMollom code to a monad based implementation. The exported
functions now execute in the MollomMonad, which at this point is defined
as follows:


<code


type MollomState = ReaderT MollomConfiguration (StateT MollomServerList
IO)


type MollomMonad = ErrorT MollomError (StateT (Maybe SessionID)
MollomState)


</code


The main concept of the code remains the same, each exported function
calls the service function. The latter returns a MollomState a, to
capture the fact that during the Mollom request, we potentially need to
update the list of servers we can query with API calls. This result is
then lifted into the MollomMonad stack by using the following function.


<code


returnStateT a = StateT $ 


</code


This is illustrated in the following control flow figure (for a full
sized image, follow the link to flickr):


[<img
src=“http://farm3.static.flickr.com/2279/4512751644
width=“352” height=“500” alt=“Control flow in hMollom”
/


The error handling is done by usage of the ErrorT monad transformer,
which add the possibility to return a Left MollomError as function
value, indicating a fault during the handling of the request. At this
point, I have not added a decent runMollomMonad function, as I am still
pondering which functions may be most useful for the users of this
library. However, you can easily employ the following function, where
defaultMollomConfiguration :: MollomConfiguration and we start without
any servers that are available.


<code


(
(Nothing) ) defaultMollomConfig ) UninitialisedServerList)


</code


As usual, the code is available from both the [GitHub
repository](http://github.com/itkovian/hMollom), as well as from
[Hackage](http://hackage.haskell.org/package/hMollom). All feedback is
welcome. Thanks to 
questions.
