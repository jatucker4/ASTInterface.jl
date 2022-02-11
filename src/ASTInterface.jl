module ASTInterface

__precompile__(false)

using Distributions
using CommonRLInterface
import Base: rand

export ASTMDP,
	   Simulation,
	   Environment,
	   EnvironmentValue,
	   reset!,
	   environment,
	   observe,
	   step!,
	   isterminal,
	   isevent,
	   distance,
	   flatten,
	   unflatten

include("AST.jl")
include("interface.jl")
include("RL.jl")

end