within WalkingInWorldOfThermoFluid.Introductory;

model FlowDrivenByHeating_ex01
  extends Modelica.Icons.Example;
  //-----
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-74, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, p = 100*1000, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-12, 64}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, T_start = 288.15, V = 0.1, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 1, p_start = 100*1000, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-12, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, T_start = 288.15, V = 0.1, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-12, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_heat(duration = 20, height = 50, offset = 0, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-84, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium = fluid1, diameter = 0.2, zeta = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-12, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(prescribedHeatFlow.port, volume.heatPort) annotation(
    Line(points = {{-40, -40}, {-22, -40}}, color = {191, 0, 0}));
  connect(ramp_heat.y, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-73, -40}, {-61, -40}}, color = {0, 0, 127}));
  connect(boundary1.ports[1], volume1.ports[1]) annotation(
    Line(points = {{-12, 54}, {-12, 16}}, color = {0, 127, 255}));
  connect(volume1.ports[2], orifice.port_b) annotation(
    Line(points = {{-12, 16}, {-12, 2}}, color = {0, 127, 255}));
  connect(orifice.port_a, volume.ports[1]) annotation(
    Line(points = {{-12, -18}, {-12, -50}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01));
end FlowDrivenByHeating_ex01;
