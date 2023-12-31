within WalkingInWorldOfThermoFluid.Temp;

model SteamGenerator_test01
  //----------
  package fluid1 = Modelica.Media.Water.StandardWater "";
  //----------
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 102 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {222, 48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = fluid1, T = 90 + 273.15, m_flow = 2, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-226, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = 0.05, length = 1) annotation(
    Placement(visible = true, transformation(origin = {192, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-168, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {170, 48}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue annotation(
    Placement(visible = true, transformation(origin = {-181, 37}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2 annotation(
    Placement(visible = true, transformation(origin = {187, 66}, extent = {{-11, -9}, {11, 9}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {-134, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 0.1*400*1000, offset = 300*1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-212, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-172, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = fluid1, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-104, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = fluid1, T = 15 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {224, -54}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3 annotation(
    Placement(visible = true, transformation(origin = {-81, -11}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-81, 8}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler equilibriumDrumBoiler(redeclare package Medium = fluid1, V_t = 1, cp_D = 0.1, m_D = 0.001, p(start = 2.2*100*1000), p_start = 2.2*100*1000) annotation(
    Placement(visible = true, transformation(origin = {-124, 26}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4 annotation(
    Placement(visible = true, transformation(origin = {196, -35}, extent = {{-10, -9}, {10, 9}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate4(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {184, -16}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = fluid1, diameter = 0.005, length = 1) annotation(
    Placement(visible = true, transformation(origin = {159, -16}, extent = {{-13, -10}, {13, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue5 annotation(
    Placement(visible = true, transformation(origin = {-97, 30}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue6 annotation(
    Placement(visible = true, transformation(origin = {3, 30}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler equilibriumDrumBoiler1(redeclare package Medium = fluid1, V_t = 1, cp_D = 0.1, m_D = 0.001, p(start = 2*100*1000), p_start = 2.1*100*1000) annotation(
    Placement(visible = true, transformation(origin = {-26, 26}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-36, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, T_start = 80 + 273.15, V = 0.5, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 4, p_start = 2.2*100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-150, 14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, T_start = 80 + 273.15, V = 0.5, nPorts = 4, p_start = 2*100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-52, 14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-52, -5}, extent = {{7, -7}, {-7, 7}}, rotation = -180)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-150, -5}, extent = {{7, -7}, {-7, 7}}, rotation = -180)));
  Modelica.Blocks.Math.Gain gain(k = 1/1000) annotation(
    Placement(visible = true, transformation(origin = {-140, -18}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {-160, -24}, extent = {{12, -8}, {-12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue7(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {-58, -25}, extent = {{12, -9}, {-12, 9}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(visible = true, transformation(origin = {-40, -16}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = fluid1, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-74, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, T_start = 100 + 273.15, V = 0.5, nPorts = 4, p_start = 2.1*100*1000, use_HeatTransfer = false, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-18, 54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue8 annotation(
    Placement(visible = true, transformation(origin = {101, 30}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 1/1000) annotation(
    Placement(visible = true, transformation(origin = {60, -16}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler equilibriumDrumBoiler2(redeclare package Medium = fluid1, V_t = 1, cp_D = 0.1, m_D = 0.001, p(start = 2*100*1000), p_start = 2*100*1000) annotation(
    Placement(visible = true, transformation(origin = {74, 26}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {48, -5}, extent = {{7, -7}, {-7, 7}}, rotation = -180)));
  Modelica.Fluid.Vessels.ClosedVolume closedVolume(redeclare package Medium = fluid1, T_start = 100 + 273.15, V = 0.5, nPorts = 4, p_start = 2*100*1000, use_HeatTransfer = false, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {84, 54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue9(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {43, -24}, extent = {{11, -8}, {-11, 8}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume closedVolume1(redeclare package Medium = fluid1, T_start = 80 + 273.15, V = 0.5, nPorts = 4, p_start = 2*100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {48, 14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = fluid1, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {14, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate31(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {23, 8}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue31 annotation(
    Placement(visible = true, transformation(origin = {21, -9}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe staticPipe(redeclare package Medium = fluid1, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-4, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow2 annotation(
    Placement(visible = true, transformation(origin = {64, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow21 annotation(
    Placement(visible = true, transformation(origin = {136, 108}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = fluid1)  annotation(
    Placement(visible = true, transformation(origin = {94, 70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue10(significantDigits = 4)  annotation(
    Placement(visible = true, transformation(origin = {88, 85}, extent = {{14, -9}, {-14, 9}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue101(significantDigits = 4)  annotation(
    Placement(visible = true, transformation(origin = {-15, 85}, extent = {{15, -9}, {-15, 9}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-8, 70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 1, height = 0*100*1000, offset = 10*1000, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {96, 118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Replicator replicator(nout = 3)  annotation(
    Placement(visible = true, transformation(origin = {-162, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = 1/3)  annotation(
    Placement(visible = true, transformation(origin = {-184, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe5(redeclare package Medium = fluid1, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {118, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue102(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {148, 85}, extent = {{14, -9}, {-14, 9}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {156, 68}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume3(redeclare package Medium = fluid1, T_start = 100 + 273.15, V = 0.5, nPorts = 4, p_start = 2*100*1000, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {142, 54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(pipe.port_b, boundary.ports[1]) annotation(
    Line(points = {{202, 48}, {212, 48}}, color = {0, 127, 255}));
  connect(massFlowRate2.port_b, pipe.port_a) annotation(
    Line(points = {{176, 48}, {182, 48}}, color = {0, 127, 255}));
  connect(realValue.numberPort, massFlowRate.m_flow) annotation(
    Line(points = {{-170.65, 37}, {-167.65, 37}, {-167.65, 14}}, color = {0, 0, 127}));
  connect(realValue2.numberPort, massFlowRate2.m_flow) annotation(
    Line(points = {{174, 66}, {170, 66}, {170, 55}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, massFlowRate3.m_flow) annotation(
    Line(points = {{-91.35, -11}, {-91.35, -5}, {-81.35, -5}, {-81.35, 1}}, color = {0, 0, 127}));
  connect(pipe1.port_b, massFlowRate3.port_a) annotation(
    Line(points = {{-94, 8}, {-87, 8}}, color = {0, 127, 255}));
  connect(realValue4.numberPort, massFlowRate4.m_flow) annotation(
    Line(points = {{184.5, -35}, {184.5, -22}, {183.65, -22}}, color = {0, 0, 127}));
  connect(pipe2.port_b, massFlowRate4.port_a) annotation(
    Line(points = {{172, -16}, {178, -16}}, color = {0, 127, 255}));
  connect(massFlowRate4.port_b, boundary3.ports[1]) annotation(
    Line(points = {{190, -16}, {200, -16}, {200, -54}, {214, -54}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler.V, realValue5.numberPort) annotation(
    Line(points = {{-113, 30}, {-108, 30}}, color = {0, 0, 127}));
  connect(equilibriumDrumBoiler1.V, realValue6.numberPort) annotation(
    Line(points = {{-15, 30}, {-8, 30}}, color = {0, 0, 127}));
  connect(equilibriumDrumBoiler.heatPort, prescribedHeatFlow.port) annotation(
    Line(points = {{-134, 26}, {-134, -38}}, color = {191, 0, 0}));
  connect(equilibriumDrumBoiler1.heatPort, prescribedHeatFlow1.port) annotation(
    Line(points = {{-36, 26}, {-36, -40}}, color = {191, 0, 0}));
  connect(massFlowRate3.port_b, volume1.ports[1]) annotation(
    Line(points = {{-75, 8}, {-52, 8}}, color = {0, 127, 255}));
  connect(volume1.ports[2], equilibriumDrumBoiler1.port_a) annotation(
    Line(points = {{-52, 8}, {-26, 8}, {-26, 16}}, color = {0, 127, 255}));
  connect(volume1.ports[3], pressure.port) annotation(
    Line(points = {{-52, 8}, {-52, 2}}, color = {0, 127, 255}));
  connect(pressure1.port, volume.ports[1]) annotation(
    Line(points = {{-150, 2}, {-150, 8}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler.port_a, volume.ports[2]) annotation(
    Line(points = {{-124, 16}, {-124, 8}, {-150, 8}}, color = {0, 127, 255}));
  connect(volume.ports[3], pipe1.port_a) annotation(
    Line(points = {{-150, 8}, {-114, 8}}, color = {0, 127, 255}));
  connect(pressure1.p, gain.u) annotation(
    Line(points = {{-142.3, -5}, {-140.3, -5}, {-140.3, -14}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, gain.y) annotation(
    Line(points = {{-146, -24}, {-140, -24}, {-140, -22}, {-140.35, -22}}, color = {0, 0, 127}));
  connect(gain1.u, pressure.p) annotation(
    Line(points = {{-40, -11.2}, {-40, -4.2}, {-44, -4.2}}, color = {0, 0, 127}));
  connect(realValue7.numberPort, gain1.y) annotation(
    Line(points = {{-44, -25}, {-40, -25}, {-40, -20}}, color = {0, 0, 127}));
  connect(massFlowRate.port_b, volume.ports[4]) annotation(
    Line(points = {{-162, 8}, {-150, 8}}, color = {0, 127, 255}));
  connect(massFlowRate.port_a, boundary1.ports[1]) annotation(
    Line(points = {{-174, 8}, {-216, 8}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler.port_b, pipe3.port_a) annotation(
    Line(points = {{-124, 36}, {-124, 48}, {-84, 48}}, color = {0, 127, 255}));
  connect(pipe3.port_b, volume2.ports[1]) annotation(
    Line(points = {{-64, 48}, {-18, 48}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler1.port_b, volume2.ports[2]) annotation(
    Line(points = {{-26, 36}, {-26, 48}, {-18, 48}}, color = {0, 127, 255}));
  connect(pipe4.port_a, volume2.ports[3]) annotation(
    Line(points = {{4, 48}, {-18, 48}}, color = {0, 127, 255}));
  connect(pipe4.port_b, closedVolume.ports[1]) annotation(
    Line(points = {{24, 48}, {84, 48}}, color = {0, 127, 255}));
  connect(staticPipe.port_a, volume1.ports[4]) annotation(
    Line(points = {{-14, 8}, {-52, 8}}, color = {0, 127, 255}));
  connect(staticPipe.port_b, massFlowRate31.port_a) annotation(
    Line(points = {{6, 8}, {18, 8}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler2.port_b, closedVolume.ports[2]) annotation(
    Line(points = {{74, 36}, {74, 48}, {84, 48}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler2.V, realValue8.numberPort) annotation(
    Line(points = {{85, 30}, {90, 30}}, color = {0, 0, 127}));
  connect(massFlowRate31.m_flow, realValue31.numberPort) annotation(
    Line(points = {{24, 2}, {24, -2}, {11, -2}, {11, -9}}, color = {0, 0, 127}));
  connect(massFlowRate31.port_b, closedVolume1.ports[1]) annotation(
    Line(points = {{30, 8}, {48, 8}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler2.port_a, closedVolume1.ports[2]) annotation(
    Line(points = {{74, 16}, {74, 8}, {48, 8}}, color = {0, 127, 255}));
  connect(pressure2.port, closedVolume1.ports[3]) annotation(
    Line(points = {{48, 2}, {48, 8}}));
  connect(pressure2.p, gain2.u) annotation(
    Line(points = {{56, -5}, {60, -5}, {60, -12}}, color = {0, 0, 127}));
  connect(realValue9.numberPort, gain2.y) annotation(
    Line(points = {{56, -24}, {59.5, -24}, {59.5, -20}, {60, -20}}, color = {0, 0, 127}));
  connect(pipe2.port_a, closedVolume1.ports[4]) annotation(
    Line(points = {{146, -16}, {120, -16}, {120, 8}, {48, 8}}, color = {0, 127, 255}));
  connect(equilibriumDrumBoiler2.heatPort, prescribedHeatFlow2.port) annotation(
    Line(points = {{64, 26}, {64, -36}}, color = {191, 0, 0}));
  connect(temperature.port, closedVolume.ports[3]) annotation(
    Line(points = {{94, 64}, {94, 48}, {84, 48}}, color = {0, 127, 255}));
  connect(temperature.T, realValue10.numberPort) annotation(
    Line(points = {{98.2, 70}, {104.2, 70}, {104.2, 85}, {104, 85}}, color = {0, 0, 127}));
  connect(temperature1.port, volume2.ports[4]) annotation(
    Line(points = {{-8, 64}, {-8, 48}, {-18, 48}}, color = {0, 127, 255}));
  connect(temperature1.T, realValue101.numberPort) annotation(
    Line(points = {{-3.8, 70}, {2, 70}, {2, 85}}, color = {0, 0, 127}));
  connect(ramp.y, gain3.u) annotation(
    Line(points = {{-201, -70}, {-193, -70}}, color = {0, 0, 127}));
  connect(replicator.y[1], prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-155.4, -70}, {-134.4, -70}, {-134.4, -58}}, color = {0, 0, 127}));
  connect(replicator.y[2], prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-155.4, -70}, {-36.4, -70}, {-36.4, -60}}, color = {0, 0, 127}));
  connect(replicator.y[3], prescribedHeatFlow2.Q_flow) annotation(
    Line(points = {{-155.4, -70}, {63.6, -70}, {63.6, -56}}, color = {0, 0, 127}));
  connect(gain3.y, replicator.u) annotation(
    Line(points = {{-177.4, -70}, {-168.4, -70}}, color = {0, 0, 127}));
  connect(ramp1.y, prescribedHeatFlow21.Q_flow) annotation(
    Line(points = {{107, 118}, {136, 118}}, color = {0, 0, 127}));
  connect(pipe5.port_a, closedVolume.ports[4]) annotation(
    Line(points = {{108, 48}, {84, 48}}, color = {0, 127, 255}));
  connect(pipe5.port_b, volume3.ports[1]) annotation(
    Line(points = {{128, 48}, {142, 48}}, color = {0, 127, 255}));
  connect(massFlowRate2.port_a, volume3.ports[2]) annotation(
    Line(points = {{164, 48}, {142, 48}}, color = {0, 127, 255}));
  connect(temperature2.port, volume3.ports[3]) annotation(
    Line(points = {{156, 62}, {156, 48}, {142, 48}}, color = {0, 127, 255}));
  connect(realValue102.numberPort, temperature2.T) annotation(
    Line(points = {{164, 86}, {164, 68}, {160, 68}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow21.port, volume3.heatPort) annotation(
    Line(points = {{136, 98}, {136, 54}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-240, -100}, {240, 140}})),
    experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-06, Interval = 0.1),
    Icon(coordinateSystem(extent = {{-240, -100}, {240, 140}})));
end SteamGenerator_test01;
