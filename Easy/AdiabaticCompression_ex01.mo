within WalkingInWorldOfThermoFluid.Easy;

model AdiabaticCompression_ex01
  extends Modelica.Icons.Example;
  //--------------------
  replaceable package fluid1 = Modelica.Media.Air.DryAirNasa(Temperature(final min = 210, final max = 5900, start = 500, nominal = 500));
  //redeclare package Medium = fluid1;
  //--------------------
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 10, p_start = 10*100*1000, T_start = 1273.15) annotation(
    Placement(transformation(origin = {-200, 52}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(nPorts = 1, redeclare package Medium = fluid1, use_m_flow_in = false, m_flow = 10, T = 288.15) annotation(
    Placement(transformation(origin = {-210, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, use_p_in = true, nPorts = 1) annotation(
    Placement(transformation(origin = {-48, -46}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-111, -33}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-72, -46}, extent = {{-6, 6}, {6, -6}})));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy1(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {127, -56}, extent = {{-6, 6}, {6, -6}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const_p1(k = 100*1000) annotation(
    Placement(transformation(origin = {-18, -38}, extent = {{6, -6}, {-6, 6}})));
  Modelica.Fluid.Sources.Boundary_pT boundary3(nPorts = 1, redeclare package Medium = fluid1, p = 10*100*1000, use_p_in = false, use_T_in = false) annotation(
    Placement(transformation(origin = {210, -46}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(transformation(origin = {-111, 3}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain11(k = 1/1000) annotation(
    Placement(transformation(origin = {127, -84}, extent = {{-4, 4}, {4, -4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {-131, 11}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {113, -96}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4) annotation(
    Placement(transformation(origin = {-116, 37}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 4) annotation(
    Placement(transformation(origin = {68, -22}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Blocks.Math.Gain gain(k = 1) annotation(
    Placement(transformation(origin = {-10, -78}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints annotation(
    Placement(transformation(origin = {16, 124}, extent = {{-20, -12}, {20, 12}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort specificEntropy1(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {88, -46}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort specificEntropy11(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-91, -46}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-108, -78}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 4) annotation(
    Placement(transformation(origin = {-134, -78}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {114, -68}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue31(significantDigits = 4) annotation(
    Placement(transformation(origin = {88, -68}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-102, -100}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain12(k = 1/1000) annotation(
    Placement(transformation(origin = {-118, -110}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue32(significantDigits = 4) annotation(
    Placement(transformation(origin = {-98, -118}, extent = {{-12, -7}, {12, 7}})));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {168, -30}, extent = {{6, 6}, {-6, -6}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain121(k = 1/1000) annotation(
    Placement(transformation(origin = {180, -16}, extent = {{-4, 4}, {4, -4}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue321(significantDigits = 4) annotation(
    Placement(transformation(origin = {166, -2}, extent = {{12, -7}, {-12, 7}}, rotation = -0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy11(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {132, 44}, extent = {{-6, 6}, {6, -6}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain111(k = 1/1000) annotation(
    Placement(transformation(origin = {132, 18}, extent = {{-4, 4}, {4, -4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue12(significantDigits = 4) annotation(
    Placement(transformation(origin = {112, 10}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue111(significantDigits = 4) annotation(
    Placement(transformation(origin = {74, 96}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary5(redeclare package Medium = fluid1, T = 1000, m_flow = 10, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
    Placement(transformation(origin = {58, 72}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort specificEntropy12(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {94, 72}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.Temperature temperature11(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {114, 50}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue311(significantDigits = 4) annotation(
    Placement(transformation(origin = {88, 50}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Fluid.Sources.Boundary_pT boundary4(redeclare package Medium = fluid1, nPorts = 1, p = 1*100*1000, use_T_in = false, use_p_in = true) annotation(
    Placement(transformation(origin = {174, 72}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Feedback dh_is annotation(
    Placement(transformation(origin = {-56, 18}, extent = {{8, 8}, {-8, -8}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant effAdiab(k = 0.9) annotation(
    Placement(transformation(origin = {-48, -6}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Math.Division dh annotation(
    Placement(transformation(origin = {-25, 2}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Math.Add h2 annotation(
    Placement(transformation(origin = {15, -2}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary51(redeclare package Medium = fluid1, nPorts = 1, use_h_in = true, use_m_flow_in = true) annotation(
    Placement(transformation(origin = {50, -46}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(massFlowRate.port_b, boundary1.ports[1]) annotation(
    Line(points = {{-66, -46}, {-58, -46}}, color = {0, 127, 255}));
  connect(const_p1.y, boundary1.p_in) annotation(
    Line(points = {{-24.6, -38}, {-36.4, -38}}, color = {0, 0, 127}));
  connect(gain1.u, specificEnthalpy.h_out) annotation(
    Line(points = {{-111, -2}, {-111, -27.5}}, color = {0, 0, 127}));
  connect(gain11.u, specificEnthalpy1.h_out) annotation(
    Line(points = {{127, -79}, {127, -63}}, color = {0, 0, 127}));
  connect(realValue.numberPort, gain1.y) annotation(
    Line(points = {{-117.2, 11}, {-110.6, 11}, {-110.6, 7}, {-111.2, 7}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, gain11.y) annotation(
    Line(points = {{127, -96}, {127, -88}}, color = {0, 0, 127}));
  connect(massFlowRate.m_flow, gain.u) annotation(
    Line(points = {{-72, -52.6}, {-72, -78.6}, {-17, -78.6}}, color = {0, 0, 127}));
  connect(realValue11.numberPort, specificEntropy1.s) annotation(
    Line(points = {{82, -22}, {88, -22}, {88, -38}}, color = {0, 0, 127}));
  connect(specificEntropy11.port_b, massFlowRate.port_a) annotation(
    Line(points = {{-84, -46}, {-78, -46}}, color = {0, 127, 255}));
  connect(realValue2.numberPort, specificEntropy11.s) annotation(
    Line(points = {{-102, 37}, {-91, 37}, {-91, -38}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.u1, specificEntropy11.s) annotation(
    Line(points = {{-6, 124}, {-6, 96}, {-91, 96}, {-91, -38}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, temperature.T) annotation(
    Line(points = {{-120.2, -78}, {-112.2, -78}}, color = {0, 0, 127}));
  connect(realValue31.numberPort, temperature1.T) annotation(
    Line(points = {{101.8, -68}, {109.8, -68}}, color = {0, 0, 127}));
  connect(pressure.p, gain12.u) annotation(
    Line(points = {{-108.6, -100}, {-118.6, -100}, {-118.6, -105}}, color = {0, 0, 127}));
  connect(realValue32.numberPort, gain12.y) annotation(
    Line(points = {{-111.8, -118}, {-117.8, -118}, {-117.8, -114}}, color = {0, 0, 127}));
  connect(pressure1.p, gain121.u) annotation(
    Line(points = {{175, -30}, {180, -30}, {180, -21}}, color = {0, 0, 127}));
  connect(realValue321.numberPort, gain121.y) annotation(
    Line(points = {{180, -2}, {180, -12}}, color = {0, 0, 127}));
  connect(boundary3.ports[1], specificEntropy1.port_b) annotation(
    Line(points = {{200, -46}, {96, -46}}, color = {0, 127, 255}));
  connect(specificEnthalpy1.port, specificEntropy1.port_b) annotation(
    Line(points = {{133, -56}, {133, -46}, {96, -46}}, color = {0, 127, 255}));
  connect(temperature1.port, specificEntropy1.port_b) annotation(
    Line(points = {{114, -62}, {114, -46}, {96, -46}}, color = {0, 127, 255}));
  connect(pressure1.port, specificEntropy1.port_b) annotation(
    Line(points = {{168, -36}, {168, -46}, {96, -46}}, color = {0, 127, 255}));
  connect(boundary.ports[1], specificEntropy11.port_a) annotation(
    Line(points = {{-200, -46}, {-98, -46}}, color = {0, 127, 255}));
  connect(specificEnthalpy.port, specificEntropy11.port_a) annotation(
    Line(points = {{-106, -33}, {-106, -46}, {-98, -46}}, color = {0, 127, 255}));
  connect(temperature.port, specificEntropy11.port_a) annotation(
    Line(points = {{-108, -72}, {-108, -46}, {-98, -46}}, color = {0, 127, 255}));
  connect(pressure.port, specificEntropy11.port_a) annotation(
    Line(points = {{-102, -94}, {-102, -46}, {-98, -46}}, color = {0, 127, 255}));
  connect(pressure1.p, boundary4.p_in) annotation(
    Line(points = {{174, -30}, {194, -30}, {194, 80}, {186, 80}}, color = {0, 0, 127}));
  connect(realValue111.numberPort, specificEntropy12.s) annotation(
    Line(points = {{88, 96}, {94, 96}, {94, 80}}, color = {0, 0, 127}));
  connect(specificEntropy12.s, inverseBlockConstraints.u2) annotation(
    Line(points = {{94, 80}, {94, 104}, {0, 104}, {0, 124}}, color = {0, 0, 127}));
  connect(boundary5.ports[1], specificEntropy12.port_a) annotation(
    Line(points = {{68, 72}, {88, 72}}, color = {0, 127, 255}));
  connect(specificEntropy12.port_b, boundary4.ports[1]) annotation(
    Line(points = {{102, 72}, {164, 72}}, color = {0, 127, 255}));
  connect(specificEntropy12.port_b, temperature11.port) annotation(
    Line(points = {{102, 72}, {114, 72}, {114, 56}}, color = {0, 127, 255}));
  connect(specificEntropy12.port_b, specificEnthalpy11.port) annotation(
    Line(points = {{102, 72}, {138, 72}, {138, 44}}, color = {0, 127, 255}));
  connect(specificEnthalpy11.h_out, gain111.u) annotation(
    Line(points = {{132, 38}, {132, 22}}, color = {0, 0, 127}));
  connect(gain111.y, realValue12.numberPort) annotation(
    Line(points = {{132, 14}, {132, 10}, {126, 10}}, color = {0, 0, 127}));
  connect(gain.y, boundary5.m_flow_in) annotation(
    Line(points = {{-4, -78}, {-2, -78}, {-2, 80}, {48, 80}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.y2, boundary5.T_in) annotation(
    Line(points = {{34, 124}, {26, 124}, {26, 76}, {46, 76}}, color = {0, 0, 127}));
  connect(realValue311.numberPort, temperature11.T) annotation(
    Line(points = {{102, 50}, {110, 50}}, color = {0, 0, 127}));
  connect(effAdiab.y, dh.u2) annotation(
    Line(points = {{-42, -6}, {-38, -6}, {-38, -2}, {-33, -2}}, color = {0, 0, 127}));
  connect(dh.y, h2.u1) annotation(
    Line(points = {{-17.3, 2}, {6.7, 2}}, color = {0, 0, 127}));
  connect(boundary51.ports[1], specificEntropy1.port_a) annotation(
    Line(points = {{60, -46}, {82, -46}}, color = {0, 127, 255}));
  connect(gain.y, boundary51.m_flow_in) annotation(
    Line(points = {{-4, -78}, {4, -78}, {4, -38}, {40, -38}}, color = {0, 0, 127}));
  connect(dh_is.y, dh.u1) annotation(
    Line(points = {{-56, 11}, {-56, 6}, {-33, 6}}, color = {0, 0, 127}));
  connect(specificEnthalpy.h_out, h2.u2) annotation(
    Line(points = {{-110, -28}, {-110, -22}, {-12, -22}, {-12, -6}, {6, -6}}, color = {0, 0, 127}));
  connect(specificEnthalpy11.h_out, dh_is.u1) annotation(
    Line(points = {{132, 38}, {132, 32}, {-56, 32}, {-56, 24}}, color = {0, 0, 127}));
  connect(specificEnthalpy.h_out, dh_is.u2) annotation(
    Line(points = {{-110, -28}, {-110, -14}, {-74, -14}, {-74, 18}, {-62, 18}}, color = {0, 0, 127}));
  connect(h2.y, boundary51.h_in) annotation(
    Line(points = {{22, -2}, {28, -2}, {28, -42}, {38, -42}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-220, -140}, {220, 140}})),
    experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-06, Interval = 0.01));
end AdiabaticCompression_ex01;
