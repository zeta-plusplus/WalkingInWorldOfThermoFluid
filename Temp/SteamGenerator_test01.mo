within WalkingInWorldOfThermoFluid.Temp;

model SteamGenerator_test01
  //----------
  package fluid1 = Modelica.Media.Water.StandardWater "";
  //----------
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 102 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {138, 48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = fluid1, T = 90 + 273.15, m_flow = 2, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-144, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = 0.1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {88, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-112, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {54, 48}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue annotation(
    Placement(visible = true, transformation(origin = {-125, 37}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2 annotation(
    Placement(visible = true, transformation(origin = {67, 69}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(transformation(origin = {-92, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 0, offset = 100*1000, startTime = 2) annotation(
    Placement(transformation(origin = {-112, -62}, extent = {{-10, -10}, {10, 10}})));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-166, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = fluid1, diameter = 0.05, length = 0.1) annotation(
    Placement(transformation(origin = {-50, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = fluid1, T = 15 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(transformation(origin = {116, -30}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue3 annotation(
    Placement(transformation(origin = {-9, -11}, extent = {{-9, -9}, {9, 9}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {-26, 8}, extent = {{-6, 6}, {6, -6}})));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler equilibriumDrumBoiler(redeclare package Medium = fluid1,V_t = 1, cp_D = 0.1, m_D = 0.001, p(start = 100*1000), p_start = 100*1000)  annotation(
    Placement(transformation(origin = {-82, 26}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4 annotation(
    Placement(transformation(origin = {75, -11}, extent = {{-9, -9}, {9, 9}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate4(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {58, 8}, extent = {{-6, 6}, {6, -6}})));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = fluid1, diameter = 0.05, length = 0.1) annotation(
    Placement(transformation(origin = {30, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue5 annotation(
    Placement(transformation(origin = {-55, 30}, extent = {{-9, -9}, {9, 9}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue6 annotation(
    Placement(transformation(origin = {35, 30}, extent = {{-9, -9}, {9, 9}})));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler equilibriumDrumBoiler1(redeclare package Medium = fluid1,V_t = 1, cp_D = 0.1, m_D = 0.001, p(start = 100*1000), p_start = 100*1000) annotation(
    Placement(transformation(origin = {6, 26}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(transformation(origin = {-4, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(boundary1.ports[1], massFlowRate.port_a) annotation(
    Line(points = {{-134, 8}, {-118, 8}}, color = {0, 127, 255}));
  connect(pipe.port_b, boundary.ports[1]) annotation(
    Line(points = {{98, 48}, {128, 48}}, color = {0, 127, 255}));
  connect(massFlowRate2.port_b, pipe.port_a) annotation(
    Line(points = {{60, 48}, {78, 48}}, color = {0, 127, 255}));
  connect(realValue.numberPort, massFlowRate.m_flow) annotation(
    Line(points = {{-115, 37}, {-112, 37}, {-112, 14}}, color = {0, 0, 127}));
  connect(realValue2.numberPort, massFlowRate2.m_flow) annotation(
    Line(points = {{57, 69}, {57, 68}, {54, 68}, {54, 55}}, color = {0, 0, 127}));
  connect(ramp.y, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-101, -62}, {-92, -62}, {-92, -46}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, massFlowRate3.m_flow) annotation(
    Line(points = {{-19.35, -11}, {-26.35, -11}, {-26.35, 2}}, color = {0, 0, 127}));
  connect(massFlowRate.port_b, equilibriumDrumBoiler.port_a) annotation(
    Line(points = {{-106, 8}, {-82, 8}, {-82, 16}}, color = {0, 127, 255}));
  connect(massFlowRate.port_b, pipe1.port_a) annotation(
    Line(points = {{-106, 8}, {-60, 8}}, color = {0, 127, 255}));
  connect(pipe1.port_b, massFlowRate3.port_a) annotation(
    Line(points = {{-40, 8}, {-32, 8}}, color = {0, 127, 255}));
  connect(realValue4.numberPort, massFlowRate4.m_flow) annotation(
    Line(points = {{64.65, -11}, {57.65, -11}, {57.65, 2}}, color = {0, 0, 127}));
  connect(massFlowRate3.port_b, pipe2.port_a) annotation(
    Line(points = {{-20, 8}, {20, 8}}, color = {0, 127, 255}));
  connect(pipe2.port_b, massFlowRate4.port_a) annotation(
    Line(points = {{40, 8}, {52, 8}}, color = {0, 127, 255}));
  connect(massFlowRate4.port_b, boundary3.ports[1]) annotation(
    Line(points = {{64, 8}, {92, 8}, {92, -30}, {106, -30}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler.port_b, massFlowRate2.port_a) annotation(
    Line(points = {{-82, 36}, {-82, 48}, {48, 48}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler.V, realValue5.numberPort) annotation(
    Line(points = {{-71, 30}, {-66, 30}}, color = {0, 0, 127}));
  connect(massFlowRate2.port_a, equilibriumDrumBoiler1.port_b) annotation(
    Line(points = {{48, 48}, {6, 48}, {6, 36}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler1.V, realValue6.numberPort) annotation(
    Line(points = {{17, 30}, {24, 30}}, color = {0, 0, 127}));
  connect(massFlowRate3.port_b, equilibriumDrumBoiler1.port_a) annotation(
    Line(points = {{-20, 8}, {6, 8}, {6, 16}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler.heatPort, prescribedHeatFlow.port) annotation(
    Line(points = {{-92, 26}, {-92, -26}}, color = {191, 0, 0}));
  connect(equilibriumDrumBoiler1.heatPort, prescribedHeatFlow1.port) annotation(
    Line(points = {{-4, 26}, {-4, -28}}, color = {191, 0, 0}));
  connect(ramp.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-100, -62}, {-4, -62}, {-4, -48}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.05));
end SteamGenerator_test01;
