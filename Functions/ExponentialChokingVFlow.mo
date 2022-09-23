within WalkingInWorldOfThermoFluid.Functions;

function ExponentialChokingVFlow
  extends Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.baseFlow;
  //-----
  import units= Modelica.SIunits;
  //-----
  input units.VolumeFlowRate V_flow_choke;
  input Real s_head=1.0;
  input units.PressureDifference head_choke=1000.0;
  //-----
protected
  units.VolumeFlowRate V_flow_internal;
algorithm
  
  if(V_flow_choke<= V_flow)then
    V_flow_internal:= (V_flow_choke+Modelica.Constants.eps);
  else
    V_flow_internal:= V_flow;
  end if;
  
  head:= noEvent(if(V_flow_internal<V_flow_choke)then -1*s_head*log((V_flow_choke-V_flow_internal)/V_flow_choke) else head_choke);
  
end ExponentialChokingVFlow;
