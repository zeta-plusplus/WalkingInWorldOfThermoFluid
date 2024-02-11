within WalkingInWorldOfThermoFluid.Easy;

model IsentropicCompression_ex01
  extends Modelica.Icons.Example;
  //--------------------
  replaceable package fluid1 = Modelica.Media.Air.DryAirNasa(Temperature(final min = 210, final max = 5900, start = 500, nominal = 500));
  //redeclare package Medium = fluid1;
  //--------------------
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 10, p_start = 10*100*1000, T_start = 1273.15) annotation(
    Placement(transformation(origin = {-200, 52}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(nPorts = 1, redeclare package Medium = fluid1, use_m_flow_in = false, m_flow = 10, T = 288.15) annotation(
    Placement(transformation(origin = {-210, -8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, use_p_in = true, nPorts = 1) annotation(
    Placement(transformation(origin = {-48, -8}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-111, 5}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-72, -8}, extent = {{-6, 6}, {6, -6}})));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy1(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {134, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const_p1(k = 100*1000) annotation(
    Placement(transformation(origin = {-18, 0}, extent = {{6, -6}, {-6, 6}})));
  Modelica.Fluid.Sources.Boundary_pT boundary3(nPorts = 1, redeclare package Medium = fluid1, p = 10*100*1000, use_p_in = false, use_T_in = false) annotation(
    Placement(transformation(origin = {208, -8}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(transformation(origin = {-111, 23}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain11(k = 1/1000) annotation(
    Placement(transformation(origin = {134, 24}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {-131, 36}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {114, 34}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4) annotation(
    Placement(transformation(origin = {-110, 46}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 4) annotation(
    Placement(transformation(origin = {68, 44}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = fluid1, T = 1000, m_flow = 10, nPorts = 1, use_m_flow_in = true, use_T_in = true) annotation(
    Placement(transformation(origin = {52, -8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain(k = 1) annotation(
    Placement(transformation(origin = {-10, -40}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints annotation(
    Placement(transformation(origin = {16, 84}, extent = {{-20, -12}, {20, 12}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort specificEntropy1(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {88, -8}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort specificEntropy11(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-91, -8}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-108, -40}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 4) annotation(
    Placement(transformation(origin = {-134, -40}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {126, -40}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue31(significantDigits = 4) annotation(
    Placement(transformation(origin = {100, -40}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-102, -62}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain12(k = 1/1000) annotation(
    Placement(transformation(origin = {-118, -72}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue32(significantDigits = 4) annotation(
    Placement(transformation(origin = {-98, -80}, extent = {{-12, -7}, {12, 7}}, rotation = -0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {134, -58}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain121(k = 1/1000) annotation(
    Placement(transformation(origin = {118, -68}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue321(significantDigits = 4) annotation(
    Placement(transformation(origin = {138, -76}, extent = {{-12, -7}, {12, 7}})));
equation
  connect(massFlowRate.port_b, boundary1.ports[1]) annotation(
    Line(points = {{-66, -8}, {-58, -8}}, color = {0, 127, 255}));
  connect(const_p1.y, boundary1.p_in) annotation(
    Line(points = {{-25, 0}, {-36.8, 0}}, color = {0, 0, 127}));
  connect(gain1.u, specificEnthalpy.h_out) annotation(
    Line(points = {{-111, 18}, {-111, 10.5}}, color = {0, 0, 127}));
  connect(gain11.u, specificEnthalpy1.h_out) annotation(
    Line(points = {{134, 19.2}, {134, 11.2}}, color = {0, 0, 127}));
  connect(realValue.numberPort, gain1.y) annotation(
    Line(points = {{-117, 36}, {-110.2, 36}, {-110.2, 27}, {-111, 27}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, gain11.y) annotation(
    Line(points = {{127.8, 34}, {133.8, 34}, {133.8, 28}}, color = {0, 0, 127}));
  connect(massFlowRate.m_flow, gain.u) annotation(
    Line(points = {{-72, -14.6}, {-72, -40.6}, {-17, -40.6}}, color = {0, 0, 127}));
  connect(gain.y, boundary2.m_flow_in) annotation(
    Line(points = {{-3.4, -40}, {8.6, -40}, {8.6, 0}, {42.6, 0}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.y2, boundary2.T_in) annotation(
    Line(points = {{34, 84}, {26, 84}, {26, -4}, {40, -4}}, color = {0, 0, 127}));
  connect(boundary2.ports[1], specificEntropy1.port_a) annotation(
    Line(points = {{62, -8}, {81, -8}}, color = {0, 127, 255}));
  connect(realValue11.numberPort, specificEntropy1.s) annotation(
    Line(points = {{81.8, 44}, {88, 44}, {88, 0}}, color = {0, 0, 127}));
  connect(specificEntropy11.port_b, massFlowRate.port_a) annotation(
    Line(points = {{-84, -8}, {-78, -8}}, color = {0, 127, 255}));
  connect(realValue2.numberPort, specificEntropy11.s) annotation(
    Line(points = {{-96, 46}, {-90, 46}, {-90, 0}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.u1, specificEntropy11.s) annotation(
    Line(points = {{-6, 84}, {-90, 84}, {-90, 0}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.u2, specificEntropy1.s) annotation(
    Line(points = {{0, 84}, {6, 84}, {6, 62}, {88, 62}, {88, 0}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, temperature.T) annotation(
    Line(points = {{-120, -40}, {-112, -40}}, color = {0, 0, 127}));
  connect(realValue31.numberPort, temperature1.T) annotation(
    Line(points = {{114, -40}, {122, -40}}, color = {0, 0, 127}));
  connect(pressure.p, gain12.u) annotation(
    Line(points = {{-108, -62}, {-118, -62}, {-118, -67}}, color = {0, 0, 127}));
  connect(realValue32.numberPort, gain12.y) annotation(
    Line(points = {{-111.8, -80}, {-117.8, -80}, {-117.8, -76}}, color = {0, 0, 127}));
  connect(pressure1.p, gain121.u) annotation(
    Line(points = {{127.4, -58}, {117.4, -58}, {117.4, -63}}, color = {0, 0, 127}));
  connect(realValue321.numberPort, gain121.y) annotation(
    Line(points = {{124.2, -76}, {118.2, -76}, {118.2, -72}}, color = {0, 0, 127}));
  connect(boundary3.ports[1], specificEntropy1.port_b) annotation(
    Line(points = {{198, -8}, {96, -8}}, color = {0, 127, 255}));
  connect(specificEnthalpy1.port, specificEntropy1.port_b) annotation(
    Line(points = {{140, 4}, {140, -8}, {96, -8}}, color = {0, 127, 255}));
  connect(temperature1.port, specificEntropy1.port_b) annotation(
    Line(points = {{126, -34}, {126, -8}, {96, -8}}, color = {0, 127, 255}));
  connect(pressure1.port, specificEntropy1.port_b) annotation(
    Line(points = {{134, -52}, {134, -8}, {96, -8}}, color = {0, 127, 255}));
  connect(boundary.ports[1], specificEntropy11.port_a) annotation(
    Line(points = {{-200, -8}, {-98, -8}}, color = {0, 127, 255}));
  connect(specificEnthalpy.port, specificEntropy11.port_a) annotation(
    Line(points = {{-106, 5}, {-106, -8}, {-98, -8}}, color = {0, 127, 255}));
  connect(temperature.port, specificEntropy11.port_a) annotation(
    Line(points = {{-108, -34}, {-108, -8}, {-98, -8}}, color = {0, 127, 255}));
  connect(pressure.port, specificEntropy11.port_a) annotation(
    Line(points = {{-102, -56}, {-102, -8}, {-98, -8}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-220, -100}, {220, 100}})),
    experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-06, Interval = 0.01));
end IsentropicCompression_ex01;
