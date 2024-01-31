within WalkingInWorldOfThermoFluid.Temp;

model AdiabaticExpansion_temp01
  extends Modelica.Icons.Example;
  //--------------------
  replaceable package fluid1 = Modelica.Media.Air.DryAirNasa(Temperature(final min=210, final max=5900, start=500, nominal=500));
  //redeclare package Medium = fluid1;
  //--------------------
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 10, p_start = 10*100*1000, T_start = 1273.15)  annotation(
    Placement(transformation(origin = {-200, 52}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(nPorts = 1, redeclare package Medium = fluid1, use_m_flow_in = false, m_flow = 10, T = 1273.15) annotation(
    Placement(transformation(origin = {-210, -8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, use_p_in = true, nPorts = 1) annotation(
    Placement(transformation(origin = {-48, -8}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-110, 5}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-72, -8}, extent = {{-6, 6}, {6, -6}})));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy1(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {90, 6}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const_p1(k = 10*100*1000) annotation(
    Placement(transformation(origin = {-18, 0}, extent = {{6, -6}, {-6, 6}})));
  Modelica.Fluid.Sources.Boundary_pT boundary3(nPorts = 1, redeclare package Medium = fluid1, p = 1*100*1000, use_p_in = false, use_T_in = false) annotation(
    Placement(transformation(origin = {208, -8}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(transformation(origin = {-110, 24}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain11(k = 1/1000) annotation(
    Placement(transformation(origin = {90, 26}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {-130, 36}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {70, 36}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4) annotation(
    Placement(transformation(origin = {-110, 46}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 4) annotation(
    Placement(transformation(origin = {88, 44}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(nPorts = 3, redeclare package Medium = fluid1, use_portsData = false, V = 0.001) annotation(
    Placement(transformation(origin = {-120, -18}, extent = {{-10, 10}, {10, -10}})));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, V = 0.001, nPorts = 3, use_portsData = false) annotation(
    Placement(transformation(origin = {128, -18}, extent = {{-10, 10}, {10, -10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = fluid1, T = 1000, m_flow = 10, nPorts = 1, use_m_flow_in = true, use_T_in = true) annotation(
    Placement(transformation(origin = {52, -8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain(k = 1) annotation(
    Placement(transformation(origin = {-10, -40}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints annotation(
    Placement(transformation(origin = {16, 84}, extent = {{-20, -12}, {20, 12}})));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, length = 1, diameter = 0.5) annotation(
    Placement(transformation(origin = {-166, -8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = fluid1, diameter = 0.5, length = 1) annotation(
    Placement(transformation(origin = {158, -8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp(height = -700, duration = 10, offset = 1000 + 273.15, startTime = 10)  annotation(
    Placement(transformation(origin = {14, 26}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort specificEntropy1(redeclare package Medium = fluid1)  annotation(
    Placement(transformation(origin = {107, -8}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort specificEntropy11(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-91, -8}, extent = {{-7, -7}, {7, 7}})));
equation
  connect(massFlowRate.port_b, boundary1.ports[1]) annotation(
    Line(points = {{-66, -8}, {-58, -8}}, color = {0, 127, 255}));
  connect(const_p1.y, boundary1.p_in) annotation(
    Line(points = {{-25, 0}, {-36.8, 0}}, color = {0, 0, 127}));
  connect(gain1.u, specificEnthalpy.h_out) annotation(
    Line(points = {{-110, 19.2}, {-110, 10.5}}, color = {0, 0, 127}));
  connect(gain11.u, specificEnthalpy1.h_out) annotation(
    Line(points = {{90, 21}, {90, 13}}, color = {0, 0, 127}));
  connect(realValue.numberPort, gain1.y) annotation(
    Line(points = {{-116, 36}, {-110.2, 36}, {-110.2, 28}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, gain11.y) annotation(
    Line(points = {{84, 36}, {90, 36}, {90, 30}}, color = {0, 0, 127}));
  connect(volume.ports[1], specificEnthalpy.port) annotation(
    Line(points = {{-120, -8}, {-105, -8}, {-105, 5}}, color = {0, 127, 255}));
  connect(specificEnthalpy1.port, volume1.ports[1]) annotation(
    Line(points = {{96, 6}, {96, -7.5}, {128, -7.5}}, color = {0, 127, 255}));
  connect(massFlowRate.m_flow, gain.u) annotation(
    Line(points = {{-72, -14.6}, {-72, -40.6}, {-17, -40.6}}, color = {0, 0, 127}));
  connect(gain.y, boundary2.m_flow_in) annotation(
    Line(points = {{-3.4, -40}, {8.6, -40}, {8.6, 0}, {42.6, 0}}, color = {0, 0, 127}));
  connect(boundary.ports[1], pipe.port_a) annotation(
    Line(points = {{-200, -8}, {-176, -8}}, color = {0, 127, 255}));
  connect(pipe.port_b, volume.ports[2]) annotation(
    Line(points = {{-156, -8}, {-120, -8}}, color = {0, 127, 255}));
  connect(volume1.ports[2], pipe1.port_a) annotation(
    Line(points = {{128, -8}, {148, -8}}, color = {0, 127, 255}));
  connect(pipe1.port_b, boundary3.ports[1]) annotation(
    Line(points = {{168, -8}, {198, -8}}, color = {0, 127, 255}));
  connect(inverseBlockConstraints.y2, boundary2.T_in) annotation(
    Line(points = {{34, 84}, {26, 84}, {26, -4}, {40, -4}}, color = {0, 0, 127}));
  connect(specificEntropy1.port_b, volume1.ports[3]) annotation(
    Line(points = {{114, -8}, {128, -8}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], specificEntropy1.port_a) annotation(
    Line(points = {{62, -8}, {100, -8}}, color = {0, 127, 255}));
  connect(realValue11.numberPort, specificEntropy1.s) annotation(
    Line(points = {{102, 44}, {108, 44}, {108, 0}}, color = {0, 0, 127}));
  connect(volume.ports[3], specificEntropy11.port_a) annotation(
    Line(points = {{-120, -8}, {-98, -8}}, color = {0, 127, 255}));
  connect(specificEntropy11.port_b, massFlowRate.port_a) annotation(
    Line(points = {{-84, -8}, {-78, -8}}, color = {0, 127, 255}));
  connect(realValue2.numberPort, specificEntropy11.s) annotation(
    Line(points = {{-96, 46}, {-90, 46}, {-90, 0}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.u1, specificEntropy11.s) annotation(
    Line(points = {{-6, 84}, {-90, 84}, {-90, 0}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.u2, specificEntropy1.s) annotation(
    Line(points = {{0, 84}, {6, 84}, {6, 64}, {108, 64}, {108, 0}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-220, -100}, {220, 100}})),
    experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-06, Interval = 0.01));
end AdiabaticExpansion_temp01;
