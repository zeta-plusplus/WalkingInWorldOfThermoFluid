within WalkingInWorldOfThermoFluid.Temp;

model PipeLine_and_Valve_01
  extends Modelica.Icons.Example;
  //*****
  replaceable package fluid1 = Modelica.Media.Water.StandardWater;
  //replaceable package fluid1 = FluidSystemComponents.Media.HydrogenCoolProp
  //redeclare package Medium = fluid1
  //*****
  parameter Real kVol=1.0;
  parameter Integer nVol = 11;
  parameter Modelica.Units.SI.Length lenPipe=5.0;
  parameter Modelica.Units.SI.Length diamPipe=0.1;
  parameter Modelica.Units.SI.Temperature Ts_init[nVol]
    ={290, 290, 290, 290, 290, 
    290, 290, 290, 290, 290,
    290};
  //*****
  Real arr_x[nVol];
  Modelica.Units.SI.Temperature arr_T[nVol];
  Modelica.Units.SI.Pressure arr_p[nVol];
  //***********************************
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-44, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, T = Ts_init[1] + 40, nPorts = 1, p = 400*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-250, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {-210, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = fluid1, T_start = Ts_init[1], V =kVol* lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-180, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = Ts_init[nVol], nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {500, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = fluid1, T_start = Ts_init[2], V =kVol* lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-120, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = fluid1, T_start = Ts_init[3], V=kVol*lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 0.5, height = 1000*1000, offset = 100*1000, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-284, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume3(redeclare package Medium = fluid1, T_start = Ts_init[4], V =kVol* lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume4(redeclare package Medium = fluid1, T_start = Ts_init[5], V =kVol* lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume5(redeclare package Medium = fluid1, T_start = Ts_init[6], V =kVol* lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {120, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe5(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume6(redeclare package Medium = fluid1, T_start = Ts_init[7], V =kVol* lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {180, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe6(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume7(redeclare package Medium = fluid1, T_start = Ts_init[8], V =kVol* lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {240, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe7(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {210, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe8(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {270, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume8(redeclare package Medium = fluid1, T_start = Ts_init[9], V =kVol* lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {300, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume9(redeclare package Medium = fluid1, T_start = Ts_init[10], V =kVol* lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {368, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe9(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {338, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve(redeclare package Medium = fluid1, dp_nominal = 10*1000, m_flow_nominal = 10) annotation(
    Placement(visible = true, transformation(origin = {404, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume10(redeclare package Medium = fluid1, T_start = Ts_init[11], V =kVol* lenPipe*Modelica.Constants.pi/4.0*diamPipe^2.0, nPorts = 2, p_start = 100*1000, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {434, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe10(redeclare package Medium = fluid1, diameter = diamPipe, length = lenPipe) annotation(
    Placement(visible = true, transformation(origin = {468, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step(height = -1, offset = 1, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {378, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary.ports[1], pipe.port_a) annotation(
    Line(points = {{-240, 10}, {-220, 10}}, color = {0, 127, 255}));
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{-200, 10}, {-190, 10}}, color = {0, 127, 255}));
  connect(pipe1.port_a, volume.ports[2]) annotation(
    Line(points = {{-160, 10}, {-190, 10}}, color = {0, 127, 255}));
  connect(pipe1.port_b, volume1.ports[1]) annotation(
    Line(points = {{-140, 10}, {-130, 10}}, color = {0, 127, 255}));
  connect(pipe2.port_a, volume1.ports[2]) annotation(
    Line(points = {{-100, 10}, {-130, 10}}, color = {0, 127, 255}));
  connect(pipe2.port_b, volume2.ports[1]) annotation(
    Line(points = {{-80, 10}, {-70, 10}}, color = {0, 127, 255}));
//*****
  for i in 1:nVol loop
    arr_x[i] = i;
  end for;
//
  arr_T[1] = volume.medium.T;
  arr_T[2] = volume1.medium.T;
  arr_T[3] = volume2.medium.T;
  arr_T[4] = volume3.medium.T;
  arr_T[5] = volume4.medium.T;
  arr_T[6] = volume5.medium.T;
  arr_T[7] = volume6.medium.T;
  arr_T[8] = volume7.medium.T;
  arr_T[9] = volume8.medium.T;
  arr_T[10] = volume9.medium.T;
  arr_T[11] = volume10.medium.T;
//
  arr_p[1] = volume.medium.p;
  arr_p[2] = volume1.medium.p;
  arr_p[3] = volume2.medium.p;
  arr_p[4] = volume3.medium.p;
  arr_p[5] = volume4.medium.p;
  arr_p[6] = volume5.medium.p;
  arr_p[7] = volume6.medium.p;
  arr_p[8] = volume7.medium.p;
  arr_p[9] = volume8.medium.p;
  arr_p[10] = volume9.medium.p;
  arr_p[11] = volume10.medium.p;
//*****
  connect(ramp.y, boundary.p_in) annotation(
    Line(points = {{-273, 18}, {-263, 18}}, color = {0, 0, 127}));
  connect(pipe3.port_a, volume2.ports[2]) annotation(
    Line(points = {{-40, 10}, {-70, 10}}, color = {0, 127, 255}));
  connect(pipe3.port_b, volume3.ports[1]) annotation(
    Line(points = {{-20, 10}, {-10, 10}}, color = {0, 127, 255}));
  connect(pipe4.port_a, volume3.ports[2]) annotation(
    Line(points = {{20, 10}, {-10, 10}}, color = {0, 127, 255}));
  connect(volume4.ports[1], pipe4.port_b) annotation(
    Line(points = {{50, 10}, {40, 10}}, color = {0, 127, 255}));
  connect(pipe5.port_a, volume4.ports[2]) annotation(
    Line(points = {{80, 10}, {50, 10}}, color = {0, 127, 255}));
  connect(volume5.ports[1], pipe5.port_b) annotation(
    Line(points = {{110, 10}, {100, 10}}, color = {0, 127, 255}));
  connect(pipe6.port_a, volume5.ports[2]) annotation(
    Line(points = {{140, 10}, {110, 10}}, color = {0, 127, 255}));
  connect(volume6.ports[1], pipe6.port_b) annotation(
    Line(points = {{170, 10}, {160, 10}}, color = {0, 127, 255}));
  connect(pipe7.port_a, volume6.ports[2]) annotation(
    Line(points = {{200, 10}, {170, 10}}, color = {0, 127, 255}));
  connect(volume7.ports[1], pipe7.port_b) annotation(
    Line(points = {{230, 10}, {220, 10}}, color = {0, 127, 255}));
  connect(pipe8.port_a, volume7.ports[2]) annotation(
    Line(points = {{260, 10}, {230, 10}}, color = {0, 127, 255}));
  connect(volume8.ports[1], pipe8.port_b) annotation(
    Line(points = {{290, 10}, {280, 10}}, color = {0, 127, 255}));
  connect(pipe9.port_b, volume9.ports[1]) annotation(
    Line(points = {{348, 10}, {358, 10}}, color = {0, 127, 255}));
  connect(pipe9.port_a, volume8.ports[2]) annotation(
    Line(points = {{328, 10}, {290, 10}}, color = {0, 127, 255}));
  connect(valve.port_a, volume9.ports[2]) annotation(
    Line(points = {{394, 10}, {358, 10}}, color = {0, 127, 255}));
  connect(valve.port_b, volume10.ports[1]) annotation(
    Line(points = {{414, 10}, {424, 10}}, color = {0, 127, 255}));
  connect(pipe10.port_a, volume10.ports[2]) annotation(
    Line(points = {{458, 10}, {424, 10}}, color = {0, 127, 255}));
  connect(pipe10.port_b, boundary1.ports[1]) annotation(
    Line(points = {{478, 10}, {490, 10}}, color = {0, 127, 255}));
  connect(step.y, valve.opening) annotation(
    Line(points = {{390, 46}, {404, 46}, {404, 18}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(coordinateSystem(extent = {{-300, -100}, {520, 100}})),
    version = "",
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));
end PipeLine_and_Valve_01;
