module ControlSystemsMTK
using RobustAndOptimalControl: NamedStateSpace
@error "Det är dags att plocka upp detta igen när ny release av https://github.com/SciML/ModelingToolkit.jl är släppt"
#=
Ideas: All connections handled by ModelingToolkit.
Names: 
- handled either by named system, or directly in constructor to ODESystem. 
Functions: 
- Give me linear system from [u1, u3] to [qm, a]
If the linearization of a full system produces a named system, one could implement getindex for vectors of names and obtain the desired transfer functions.


Another idea: use modelingtoolkitize/build_function to obtain a function that can be differentiated with ForwardDiff or FD, https://discourse.julialang.org/t/differentialequations-control-systems-and-linearization/31178/6


A third idea: just use named systems with named indexing to obtain any system you want.

=#
using ModelingToolkit, ControlSystems
using ControlSystems: ssdata, AbstractStateSpace, Continuous, nstates, noutputs, ninputs
using ControlSystemIdentification
using RobustAndOptimalControl
import ModelingToolkit: ODESystem, FnType
using ModelingToolkit: states, observed, isdifferential
using DifferentialEquations
using ModelingToolkit.Symbolics
using ModelingToolkit.Symbolics: jacobian, solve_for
using UnPack
using Optim, Optim.LineSearches

export sconnect, feedback, ODESystem, states, observed, named_ss

include("ode_system.jl")
include("symbolic_optimization.jl")


end
