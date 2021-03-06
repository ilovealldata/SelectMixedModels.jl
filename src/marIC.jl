function marAIC(m::LinearMixedModel)

    rho = length(MixedModels.θ(m))+length(fixef(m))+1
    llk = -objective(m)/2.0

    cr=[1.0, 0.0]
   
   val=-2.0*llk+2.0*(cr[1]*rho+cr[2])
   
    IC(llk, rho, "MarAIC", cr, val  )
end

function marBIC(m::LinearMixedModel)

    rho = length(MixedModels.θ(m))+length(fixef(m))+1
    llk = -objective(m)/2.0
    n,p,q,k = size(m)
    #(nn,pp,qq,tt)=size(m)

    cr=[1.0, 0.0]

    val=-2.0*llk+log(n)*(cr[1]*rho+cr[2])
    
    IC(llk, rho, "MarBIC", cr, val )
end