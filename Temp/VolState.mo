within WalkingInWorldOfThermoFluid.Temp;

model VolState
  extends Modelica.Icons.Example;
  //--------------------
  //replaceable package fluid1 = Modelica.Media.Air.DryAirNasa(Temperature(final min=200, final max=5999, start=500, nominal=500));
  replaceable package fluid1 = Modelica.Media.IdealGases.SingleGases.N2(Temperature(final min = 200, final max = 5999, start = 500, nominal = 500));
  //redeclare package Medium = fluid1;
  //--------------------
  Modelica.Fluid.Vessels.ClosedVolume volume(nPorts = 2, redeclare package Medium = fluid1, use_portsData = false, V = 0.001) annotation(
    Placement(transformation(origin = {-8, -4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(nPorts = 1, use_p_in = true, use_T_in = true, redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-38, -14}, extent = {{-10, -10}, {10, 10}})));
  inner Modelica.Fluid.System system(m_flow_start = 1, p_start = 99999.99999999999, T_start(displayUnit = "K") = 200, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial) annotation(
    Placement(transformation(origin = {-58, 88}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_p(height = 0, duration = 10, offset = 100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {-78, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_T(height = 5799, duration = 10, offset = 200, startTime = 20) annotation(
    Placement(transformation(origin = {-78, -26}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = fluid1, m_flow = -1, nPorts = 1) annotation(
    Placement(transformation(origin = {66, -14}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
equation
  connect(boundary.ports[1], volume.ports[1]) annotation(
    Line(points = {{-28, -14}, {-8, -14}}, color = {0, 127, 255}));
  connect(ramp_p.y, boundary.p_in) annotation(
    Line(points = {{-67, 10}, {-57, 10}, {-57, -6}, {-51, -6}}, color = {0, 0, 127}));
  connect(ramp_T.y, boundary.T_in) annotation(
    Line(points = {{-67, -26}, {-61, -26}, {-61, -10}, {-51, -10}}, color = {0, 0, 127}));
  connect(boundary1.ports[1], volume.ports[2]) annotation(
    Line(points = {{56, -14}, {-8, -14}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-06, Interval = 0.01));
end VolState;
