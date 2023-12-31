within WalkingInWorldOfThermoFluid.Normal;

model Boiler_withCirculation_ex01
  extends Modelica.Icons.Example;
  //----------
  package fluid1 = Modelica.Media.Water.StandardWater "";
  //----------
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = 110 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {176, 52}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = fluid1, T = 100 + 273.15, m_flow = 2, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-178, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = 0.05, length = 5) annotation(
    Placement(visible = true, transformation(origin = {139, 52}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-146, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-2, 52}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue annotation(
    Placement(visible = true, transformation(origin = {-159, 37}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2 annotation(
    Placement(visible = true, transformation(origin = {13, 72}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {-130, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 1*1000, offset = 1000*1000, startTime = 2) annotation(
    Placement(visible = true, transformation(origin = {-162, -25}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-166, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3 annotation(
    Placement(visible = true, transformation(origin = {-46, -38}, extent = {{13, -7}, {-13, 7}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-12, -38}, extent = {{-6, 6}, {6, -6}}, rotation = -90)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler equilibriumDrumBoiler(redeclare package Medium = fluid1, V_t = 0.1, cp_D = 0.1, m_D = 0.001, p(start = 100*1000), p_start = 2*100*1000) annotation(
    Placement(visible = true, transformation(origin = {-62, 26}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue5(significantDigits = 3) annotation(
    Placement(visible = true, transformation(origin = {-33, 30}, extent = {{-11, -9}, {11, 9}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, T_start = 110 + 273.15, V = 0.02, nPorts = 4, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-42, 58}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.Density density(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-14, 89}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue7(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-37, 89}, extent = {{11, -7}, {-11, 7}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = fluid1, diameter = 0.05, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-12, -12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-62, -3}, extent = {{7, -7}, {-7, 7}}, rotation = -180)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, T_start = 110 + 273.15, V = 0.02, nPorts = 5, p_start = 2*100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-100, 14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, T_start = 110 + 273.15, V = 0.02, nPorts = 3, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-12, -73}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Machines.ControlledPump pump(redeclare package Medium = fluid1, control_m_flow = true, m_flow_nominal = 1, p_a_nominal = 100*1000, p_b_nominal = 5*100*1000, use_m_flow_set = true, use_p_set = false) annotation(
    Placement(visible = true, transformation(origin = {-100, -44}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {-54, -21}, extent = {{10, -7}, {-10, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1/1000) annotation(
    Placement(visible = true, transformation(origin = {-42, -8}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(visible = true, transformation(origin = {23, -82}, extent = {{-4, 4}, {4, -4}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue11(significantDigits = 5) annotation(
    Placement(visible = true, transformation(origin = {11, -70}, extent = {{10, -7}, {-10, 7}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {4, -87}, extent = {{7, -7}, {-7, 7}}, rotation = -180)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-28, 66}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue10(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-32, 79}, extent = {{12, -7}, {-12, 7}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue101(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-100, 45}, extent = {{12, -7}, {-12, 7}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-90, 32}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Sensors.Density density1(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {-82, 55}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue71(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-105, 55}, extent = {{11, -7}, {-11, 7}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume3(redeclare package Medium = fluid1, T_start = 110 + 273.15, V = 0.02, nPorts = 3, p_start = 100*1000, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {42, 58}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = fluid1, diameter = 0.1, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {22, 52}, extent = {{-6, -10}, {6, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow21 annotation(
    Placement(visible = true, transformation(origin = {36, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 1, height = 100*1000, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {14, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = fluid1) annotation(
    Placement(visible = true, transformation(origin = {58, 68}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue102(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {52, 84}, extent = {{12, -8}, {-12, 8}}, rotation = 0)));
equation
  connect(boundary1.ports[1], massFlowRate.port_a) annotation(
    Line(points = {{-168, 8}, {-152, 8}}, color = {0, 127, 255}, thickness = 1));
  connect(pipe.port_b, boundary.ports[1]) annotation(
    Line(points = {{154, 52}, {166, 52}}, color = {0, 127, 255}, thickness = 1));
  connect(realValue.numberPort, massFlowRate.m_flow) annotation(
    Line(points = {{-148.65, 37}, {-145.65, 37}, {-145.65, 14}}, color = {0, 0, 127}));
  connect(realValue2.numberPort, massFlowRate2.m_flow) annotation(
    Line(points = {{2.65, 72}, {-2.35, 72}, {-2.35, 59}, {-2, 59}}, color = {0, 0, 127}));
  connect(ramp.y, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-151, -25}, {-140, -25}}, color = {0, 0, 127}));
  connect(realValue3.numberPort, massFlowRate3.m_flow) annotation(
    Line(points = {{-31.05, -38}, {-18.35, -38}}, color = {0, 0, 127}));
  connect(equilibriumDrumBoiler.V, realValue5.numberPort) annotation(
    Line(points = {{-51, 30}, {-46, 30}}, color = {0, 0, 127}));
  connect(equilibriumDrumBoiler.heatPort, prescribedHeatFlow.port) annotation(
    Line(points = {{-72, 26}, {-72, -25}, {-120, -25}}, color = {191, 0, 0}, thickness = 1));
  connect(volume1.ports[1], massFlowRate2.port_a) annotation(
    Line(points = {{-42, 52}, {-8, 52}}, color = {0, 127, 255}, thickness = 1));
  connect(volume1.ports[2], equilibriumDrumBoiler.port_b) annotation(
    Line(points = {{-42, 52}, {-62, 52}, {-62, 36}}, color = {0, 127, 255}, thickness = 1));
  connect(density.d, realValue7.numberPort) annotation(
    Line(points = {{-19.5, 89}, {-24, 89}}, color = {0, 0, 127}));
  connect(pressure.port, equilibriumDrumBoiler.port_a) annotation(
    Line(points = {{-62, 4}, {-62, 16}}, color = {0, 127, 255}));
  connect(massFlowRate.port_b, volume.ports[1]) annotation(
    Line(points = {{-140, 8}, {-100, 8}}, color = {0, 127, 255}, thickness = 1));
  connect(volume.ports[2], equilibriumDrumBoiler.port_a) annotation(
    Line(points = {{-100, 8}, {-62, 8}, {-62, 16}}, color = {0, 127, 255}, thickness = 1));
  connect(pump.port_b, volume.ports[3]) annotation(
    Line(points = {{-100, -34}, {-100, 8}}, color = {0, 127, 255}, thickness = 1));
  connect(pressure.p, gain.u) annotation(
    Line(points = {{-54.3, -3}, {-42.3, -3}}, color = {0, 0, 127}));
  connect(gain.y, realValue1.numberPort) annotation(
    Line(points = {{-42, -12.4}, {-42, -14.4}, {-42.5, -14.4}, {-42.5, -21.4}}, color = {0, 0, 127}));
  connect(pressure1.port, volume2.ports[1]) annotation(
    Line(points = {{4, -80}, {-12, -80}}, color = {0, 127, 255}));
  connect(realValue11.numberPort, gain1.y) annotation(
    Line(points = {{22.5, -70}, {23, -70}, {23, -78}}, color = {0, 0, 127}));
  connect(temperature.port, volume1.ports[3]) annotation(
    Line(points = {{-28, 60}, {-28, 52}, {-42, 52}}, color = {0, 127, 255}));
  connect(temperature.T, realValue10.numberPort) annotation(
    Line(points = {{-23.8, 66}, {-17.8, 66}, {-17.8, 79}}, color = {0, 0, 127}));
  connect(density.port, volume1.ports[4]) annotation(
    Line(points = {{-14, 84}, {-14, 52}, {-42, 52}}, color = {0, 127, 255}));
  connect(temperature1.T, realValue101.numberPort) annotation(
    Line(points = {{-85.8, 32}, {-85.8, 45}}, color = {0, 0, 127}));
  connect(temperature1.port, volume.ports[4]) annotation(
    Line(points = {{-90, 26}, {-90, 8}, {-100, 8}}, color = {0, 127, 255}));
  connect(pressure1.p, gain1.u) annotation(
    Line(points = {{11.7, -87}, {22.7, -87}}, color = {0, 0, 127}));
  connect(pipe1.port_a, equilibriumDrumBoiler.port_a) annotation(
    Line(points = {{-12, -2}, {-12, 12}, {-62, 12}, {-62, 16}}, color = {0, 127, 255}, thickness = 1));
  connect(pipe1.port_b, massFlowRate3.port_a) annotation(
    Line(points = {{-12, -22}, {-12, -32}}, color = {0, 127, 255}, thickness = 1));
  connect(massFlowRate3.port_b, volume2.ports[2]) annotation(
    Line(points = {{-12, -44}, {-12, -80}}, color = {0, 127, 255}, thickness = 1));
  connect(pump.port_a, volume2.ports[3]) annotation(
    Line(points = {{-100, -54}, {-100, -80}, {-12, -80}}, color = {0, 127, 255}, thickness = 1));
  connect(massFlowRate3.m_flow, pump.m_flow_set) annotation(
    Line(points = {{-19, -38}, {-19, -49}, {-91.6, -49}}, color = {0, 0, 127}));
  connect(density1.d, realValue71.numberPort) annotation(
    Line(points = {{-87.5, 55}, {-92, 55}}, color = {0, 0, 127}));
  connect(density1.port, volume.ports[5]) annotation(
    Line(points = {{-82, 50}, {-82, 8}, {-100, 8}}, color = {0, 127, 255}));
  connect(pipe.port_a, volume3.ports[1]) annotation(
    Line(points = {{124, 52}, {42, 52}}, color = {0, 127, 255}, thickness = 1));
  connect(massFlowRate2.port_b, pipe2.port_a) annotation(
    Line(points = {{4, 52}, {16, 52}}, color = {0, 127, 255}, thickness = 1));
  connect(pipe2.port_b, volume3.ports[2]) annotation(
    Line(points = {{28, 52}, {42, 52}}, color = {0, 127, 255}, thickness = 1));
  connect(ramp1.y, prescribedHeatFlow21.Q_flow) annotation(
    Line(points = {{25, 120}, {36, 120}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow21.port, volume3.heatPort) annotation(
    Line(points = {{36, 100}, {36, 58}}, color = {191, 0, 0}, thickness = 1));
  connect(realValue102.numberPort, temperature2.T) annotation(
    Line(points = {{65.8, 84}, {65.8, 68}, {61.8, 68}}, color = {0, 0, 127}));
  connect(temperature2.port, volume3.ports[3]) annotation(
    Line(points = {{58, 62}, {58, 52}, {42, 52}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 140}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1));
end Boiler_withCirculation_ex01;
