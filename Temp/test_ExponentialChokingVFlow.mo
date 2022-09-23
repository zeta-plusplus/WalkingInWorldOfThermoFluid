within WalkingInWorldOfThermoFluid.Temp;

model test_ExponentialChokingVFlow
  extends Modelica.Icons.Example;
  Real V_flow;
  Real head;
  function flowFunc = WalkingInWorldOfThermoFluid.Functions.ExponentialChokingVFlow(V_flow_choke = 10.0, s_head = 0.9);
equation
  V_flow =time * 0.1;
  head = flowFunc(V_flow = V_flow);
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.2));
end test_ExponentialChokingVFlow;
