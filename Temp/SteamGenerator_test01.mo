within WalkingInWorldOfThermoFluid.Temp;

model SteamGenerator_test01
  //----------
  package fluid1 = Modelica.Media.Water.StandardWater "";
  //----------
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 102 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {180, 48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = fluid1, T = 90 + 273.15, m_flow = 2, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-184, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = 0.05, length = 1) annotation(
    Placement(visible = true, transformation(origin = {130, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-126, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {96, 48}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue annotation(
    Placement(visible = true, transformation(origin = {-139, 37}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2 annotation(
    Placement(visible = true, transformation(origin = {111, 69}, extent = {{-11, -9}, {11, 9}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {-92, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 0*100*1000, offset = 100*1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-120, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-166, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = fluid1, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-62, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = fluid1, T = 15 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {182, -54}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3 annotation(
    Placement(visible = true, transformation(origin = {-39, -11}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-39, 8}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler equilibriumDrumBoiler(redeclare package Medium = fluid1, V_t = 1, cp_D = 0.1, m_D = 0.001, p(start = 2.1*100*1000), p_start = 2.1*100*1000) annotation(
    Placement(transformation(origin = {-82, 26}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4 annotation(
    Placement(visible = true, transformation(origin = {136, -35}, extent = {{-10, -9}, {10, 9}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate4(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {124, -16}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = fluid1, diameter = 0.005, length = 1) annotation(
    Placement(visible = true, transformation(origin = {99, -16}, extent = {{-13, -10}, {13, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue5 annotation(
    Placement(transformation(origin = {-55, 30}, extent = {{-9, -9}, {9, 9}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue6 annotation(
    Placement(visible = true, transformation(origin = {45, 30}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler equilibriumDrumBoiler1(redeclare package Medium = fluid1, V_t = 1, cp_D = 0.1, m_D = 0.001, p(start = 2*100*1000), p_start = 2*100*1000) annotation(
    Placement(visible = true, transformation(origin = {16, 26}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {6, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, T_start = 80 + 273.15, V = 0.5, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 4, p_start = 2.1*100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-108, 14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, T_start = 80 + 273.15, V = 0.5, nPorts = 1, p_start = 2*100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-10, 14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-10, -5}, extent = {{7, -7}, {-7, 7}}, rotation = -180)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-108, -5}, extent = {{7, -7}, {-7, 7}}, rotation = -180)));
  Modelica.Blocks.Math.Gain gain(k = 1/1000)  annotation(
    Placement(visible = true, transformation(origin = {-98, -18}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 3)  annotation(
    Placement(visible = true, transformation(origin = {-117, -24}, extent = {{11, -8}, {-11, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue7(significantDigits = 3)  annotation(
    Placement(visible = true, transformation(origin = {-14, -24}, extent = {{10, -8}, {-10, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(visible = true, transformation(origin = {2, -16}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = fluid1, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-32, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pipe.port_b, boundary.ports[1]) annotation(
    Line(points = {{140, 48}, {170, 48}}, color = {0, 127, 255}));
  connect(massFlowRate2.port_b, pipe.port_a) annotation(
    Line(points = {{102, 48}, {120, 48}}, color = {0, 127, 255}));
  connect(realValue.numberPort, massFlowRate.m_flow) annotation(
    Line(points = {{-128.65, 37}, {-125.65, 37}, {-125.65, 14}}, color = {0, 0, 127}));
  connect(realValue2.numberPort, massFlowRate2.m_flow) annotation(
    Line(points = {{98.35, 69}, {98.35, 68}, {96, 68}, {96, 55}}, color = {0, 0, 127}));
  connect(ramp.y, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-109, -86}, {-92, -86}, {-92, -76}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, massFlowRate3.m_flow) annotation(
    Line(points = {{-49.35, -11}, {-49.35, -5}, {-39.35, -5}, {-39.35, 1}}, color = {0, 0, 127}));
  connect(pipe1.port_b, massFlowRate3.port_a) annotation(
    Line(points = {{-52, 8}, {-45, 8}}, color = {0, 127, 255}));
  connect(realValue4.numberPort, massFlowRate4.m_flow) annotation(
    Line(points = {{124.5, -35}, {124.5, -22}, {123.65, -22}}, color = {0, 0, 127}));
  connect(pipe2.port_b, massFlowRate4.port_a) annotation(
    Line(points = {{112, -16}, {118, -16}}, color = {0, 127, 255}));
  connect(massFlowRate4.port_b, boundary3.ports[1]) annotation(
    Line(points = {{130, -16}, {158, -16}, {158, -54}, {172, -54}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler.V, realValue5.numberPort) annotation(
    Line(points = {{-71, 30}, {-66, 30}}, color = {0, 0, 127}));
  connect(massFlowRate2.port_a, equilibriumDrumBoiler1.port_b) annotation(
    Line(points = {{90, 48}, {16, 48}, {16, 36}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler1.V, realValue6.numberPort) annotation(
    Line(points = {{27, 30}, {34, 30}}, color = {0, 0, 127}));
  connect(equilibriumDrumBoiler.heatPort, prescribedHeatFlow.port) annotation(
    Line(points = {{-92, 26}, {-92, -56}}, color = {191, 0, 0}));
  connect(equilibriumDrumBoiler1.heatPort, prescribedHeatFlow1.port) annotation(
    Line(points = {{6, 26}, {6, -66}}, color = {191, 0, 0}));
  connect(ramp.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-109, -86}, {6, -86}}, color = {0, 0, 127}));
  connect(massFlowRate3.port_b, volume1.ports[1]) annotation(
    Line(points = {{-33, 8}, {-10, 8}}, color = {0, 127, 255}));
  connect(volume1.ports[2], equilibriumDrumBoiler1.port_a) annotation(
    Line(points = {{-10, 8}, {16, 8}, {16, 16}}, color = {0, 127, 255}));
  connect(volume1.ports[3], pressure.port) annotation(
    Line(points = {{-10, 8}, {-10, 2}}, color = {0, 127, 255}));
  connect(pressure1.port, volume.ports[1]) annotation(
    Line(points = {{-108, 2}, {-108, 8}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler.port_a, volume.ports[2]) annotation(
    Line(points = {{-82, 16}, {-82, 8}, {-108, 8}}, color = {0, 127, 255}));
  connect( volume.ports[3], pipe1.port_a) annotation(
    Line(points = {{-108, 8}, {-72, 8}}, color = {0, 127, 255}));
  connect(pressure1.p, gain.u) annotation(
    Line(points = {{-100, -5}, {-98, -5}, {-98, -14}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, gain.y) annotation(
    Line(points = {{-104, -24}, {-98, -24}, {-98, -22}}, color = {0, 0, 127}));
  connect(gain1.u, pressure.p) annotation(
    Line(points = {{2, -12}, {2, -5}, {-2, -5}}, color = {0, 0, 127}));
  connect(realValue7.numberPort, gain1.y) annotation(
    Line(points = {{-2.5, -24}, {2, -24}, {2, -20}}, color = {0, 0, 127}));
  connect(massFlowRate.port_b, volume.ports[4]) annotation(
    Line(points = {{-120, 8}, {-108, 8}}, color = {0, 127, 255}));
  connect(massFlowRate.port_a, boundary1.ports[1]) annotation(
    Line(points = {{-132, 8}, {-174, 8}}, color = {0, 127, 255}));
  connect(pipe3.port_b, massFlowRate2.port_a) annotation(
    Line(points = {{-22, 48}, {90, 48}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler.port_b, pipe3.port_a) annotation(
    Line(points = {{-82, 36}, {-82, 48}, {-42, 48}}, color = {0, 127, 255}));
  connect(pipe2.port_a, volume1.ports[1]) annotation(
    Line(points = {{86, -16}, {76, -16}, {76, 8}, {-10, 8}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1));
end SteamGenerator_test01;
