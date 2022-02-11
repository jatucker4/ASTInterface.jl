# To be implemented by user.

"""
    ASTInterface.Simulation

Parent type for user simulation.
"""
abstract type Simulation <: AbstractSimulation end


"""
    ASTInterface.reset!

Resets simulation.
"""
function reset!(sim::Simulation)::Nothing end


"""
    ASTInterface.environment

Returns Environment object constructed in simulation.
Environment is an alias of Dict{Symbol, Sampleable}.
"""
function environment(sim::Simulation)::Environment end


"""
    ASTInterface.observe

Returns quasi-normalized observation of simulation.
"""
function observe(sim::Simulation)::Vector{<:Real} end


"""
    ASTInterface.step!

Steps simulation given an EnvironmentValue object.
EnvironmentValue is an alias of Dict{Symbol, Any}.
"""
function step!(sim::Simulation, x::EnvironmentValue)::Nothing end


"""
    ASTInterface.isterminal

Checks whether simulation has finished due to time limit or terminal state, independent of event status.
"""
function isterminal(sim::Simulation)::Bool end


"""
    ASTInterface.isevent

Checks whether simulation is in an event state.
"""
function isevent(sim::Simulation)::Bool end


"""
    ASTInterface.distance

Returns custom metric of distance to event. For best results, metric should depend only on current state.
"""
function distance(sim::Simulation)::Real end


"""
    ASTInterface.flatten

Flattens environment variable to quasi-normalized array.
"""
function flatten(distribution::Any, value::Any)::Vector{<:Real} end


"""
    ASTInterface.unflatten

Reconstructs environment variable from quasi-normalized array.
"""
function unflatten(distribution::Any, array::Vector{<:Real})::Any end
