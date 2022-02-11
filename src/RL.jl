# Connects ASTInterface with CommonRLInterface, allowing compatibility with standard RL-based solvers.

CommonRLInterface.reset!(mdp::ASTMDP) = reset!(mdp.sim)

CommonRLInterface.actions(mdp::ASTMDP) = environment(mdp.sim)

CommonRLInterface.observe(mdp::ASTMDP) = Float32.(observe(mdp.sim))

function CommonRLInterface.act!(mdp::ASTMDP, action::Vector{<:Real})
	env = environment(mdp.sim)
	value = unflatten(mdp, action)
	sample = create_sample(env, value)

	d1 = distance(mdp.sim)
	step!(mdp.sim, value)
	d2 = distance(mdp.sim)
	r = reward(mdp, sample, (d1, d2))
	return r
end

CommonRLInterface.terminated(mdp::ASTMDP) = isterminal(mdp.sim) || isevent(mdp.sim)
