within WalkingInWorldOfThermoFluid.Hard;

model RefrigCycleMachine_R134_ex04
  extends Modelica.Icons.Example;
  //-------------------------
  package fluid1 = Modelica.Media.R134a.R134a_ph;
  //package fluid2 = Modelica.Media.Air.DryAirNasa;
  //-------------------------
  parameter Integer sigDigits_T = 4;
  parameter Integer sigDigits_p = 5;
  parameter Integer sigDigits_Q_flow = 5;
  parameter Integer sigDigits_m_flow = 4;
  parameter Integer sigDigits_rho = 4;
  //-------------------------
  constant Integer nArrStates = 9;
  Modelica.Units.SI.Temperature Arr_T[nArrStates + curve_Ts_HX020.nPts_par + curve_Ts_HX040.nPts_par];
  Modelica.Units.SI.SpecificEntropy Arr_s[nArrStates + curve_Ts_HX020.nPts_par + curve_Ts_HX040.nPts_par];
  /**/
  //-------------------------
  inner Modelica.Fluid.System system(p_ambient = 1e5, T_ambient = 288.15, p_start = 1e5, T_start = 288.15) annotation(
    Placement(transformation(origin = {14, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Valves.ValveLinear Valve030(redeclare package Medium = fluid1, dp_nominal = 1e6, m_flow_nominal = 1) annotation(
    Placement(transformation(origin = {118, 211}, extent = {{13, -13}, {-13, 13}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Valve030_open(duration = 1, height = 0, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {91, 211}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Valve030_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {87, 169}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Valve030_in(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {85, 249}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Sources.Constant const(k = 273.15) annotation(
    Placement(transformation(origin = {107, 175}, extent = {{-2, -2}, {2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {107, 169}, extent = {{-2, -2}, {2, 2}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const1(k = 273.15) annotation(
    Placement(transformation(origin = {106, 243}, extent = {{-2, -2}, {2, 2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(transformation(origin = {106, 249}, extent = {{-2, 2}, {2, -2}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {137, 182}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_in(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {137, 237}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {118, 261.5}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {118, 156}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {118, 249}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {118, 237}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {118, 169}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {118, 182}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume Vol030(redeclare package Medium = fluid1, use_portsData = false, V = 0.001, nPorts = 2) annotation(
    Placement(transformation(origin = {118, 278}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Fluid.Vessels.ClosedVolume Vol031(redeclare package Medium = fluid1, V = 0.001, use_portsData = false, nPorts = 2) annotation(
    Placement(transformation(origin = {118, 138}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice dP031(redeclare package Medium = fluid1, diameter = 0.2, zeta = 1) annotation(
    Placement(transformation(origin = {132, 126}, extent = {{-8, -8}, {8, 8}})));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {312, 298}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice dP021(redeclare package Medium = fluid1, diameter = 0.2, zeta = 1) annotation(
    Placement(transformation(origin = {134, 298}, extent = {{8, -8}, {-8, 8}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_m_flow_Cmp010_out(significantDigits = sigDigits_m_flow) annotation(
    Placement(transformation(origin = {333, 325}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX020 annotation(
    Placement(transformation(origin = {170, 344}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_HX030_hconv(duration = 1, height = 0, offset = 1*10000, startTime = 10) annotation(
    Placement(transformation(origin = {170, 323}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_hot(T = 298.15) annotation(
    Placement(transformation(origin = {126, 344}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor Q_flow_HX020 annotation(
    Placement(transformation(origin = {150, 344}, extent = {{-4, -4}, {4, 4}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(transformation(origin = {203, 361}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Q_flow_HX020(significantDigits = sigDigits_Q_flow) annotation(
    Placement(transformation(origin = {230, 361}, extent = {{-13, -11}, {13, 11}})));
  Modelica.Fluid.Vessels.ClosedVolume HX020(redeclare package Medium = fluid1, V = 0.1, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(transformation(origin = {231, 310}, extent = {{-12, -12}, {12, 12}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor CpHX020(C = 10, T(start = 288.15)) annotation(
    Placement(transformation(origin = {191, 351}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cond_HX020(G = 10000) annotation(
    Placement(transformation(origin = {207, 344}, extent = {{-5, 5}, {5, -5}}, rotation = 180)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice dP011(redeclare package Medium = fluid1, diameter = 0.2, zeta = 1) annotation(
    Placement(transformation(origin = {288, 298}, extent = {{8, -8}, {-8, 8}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {200, 298}, extent = {{-3, -3}, {3, 3}}, rotation = 180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {210, 298}, extent = {{3, 3}, {-3, -3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_HX020_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {185, 287}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Sources.Constant const2(k = 273.15) annotation(
    Placement(transformation(origin = {206, 281}, extent = {{-2, -2}, {2, 2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(
    Placement(transformation(origin = {206, 287}, extent = {{-2, 2}, {2, -2}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure p_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {223, 273}, extent = {{3, 3}, {-3, -3}})));
  Modelica.Blocks.Math.Gain gain(k = 1/1000) annotation(
    Placement(transformation(origin = {215, 273}, extent = {{2, -2}, {-2, 2}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_p_HX020_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {195, 273}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Fluid.Vessels.ClosedVolume HX040(redeclare package Medium = fluid1, V = 0.1, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(transformation(origin = {187, 114}, extent = {{12, 12}, {-12, -12}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {228, 126}, extent = {{3, 3}, {-3, -3}}, rotation = 180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {206, 126}, extent = {{-3, 3}, {3, -3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_HX020_out1(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {233, 109}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const21(k = 273.15) annotation(
    Placement(transformation(origin = {208, 103}, extent = {{-2, -2}, {2, 2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback21 annotation(
    Placement(transformation(origin = {208, 109}, extent = {{2, 2}, {-2, -2}}, rotation = -180)));
  Modelica.Fluid.Sensors.Pressure p_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {199, 147}, extent = {{3, -3}, {-3, 3}})));
  Modelica.Blocks.Math.Gain gain2(k = 1/1000) annotation(
    Placement(transformation(origin = {191, 147}, extent = {{2, -2}, {-2, 2}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_p_HX040_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {171, 147}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Fluid.Sensors.DensityTwoPort rho_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {218, 126}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_HX040_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {199, 160}, extent = {{8, -5}, {-8, 5}})));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX040 annotation(
    Placement(transformation(origin = {146, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_HX040_hconv(duration = 1, height = 0, offset = 1*10000, startTime = 10) annotation(
    Placement(transformation(origin = {146, 47}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_cold(T = 283.15) annotation(
    Placement(transformation(origin = {102, 68}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor Q_flow_HX040 annotation(
    Placement(transformation(origin = {125, 68}, extent = {{4, -4}, {-4, 4}}, rotation = -180)));
  Modelica.Blocks.Math.Gain gain3(k = 1/1000) annotation(
    Placement(transformation(origin = {135, 97}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Q_flow_HX040(significantDigits = sigDigits_Q_flow) annotation(
    Placement(transformation(origin = {156, 97}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor CpHX040(C = 10, T(start = 288.15)) annotation(
    Placement(transformation(origin = {169, 75}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cond_HX040(G = 10000) annotation(
    Placement(transformation(origin = {185, 68}, extent = {{5, 5}, {-5, -5}}, rotation = -180)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp010_PR(duration = 5, height = 10, offset = 10, startTime = 50) annotation(
    Placement(transformation(origin = {392, 248}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 1, height = 0, offset = 100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {365, 134}, extent = {{-4, 4}, {4, -4}}, rotation = -180)));
  Modelica.Fluid.Vessels.ClosedVolume Vol_Cmp010_out(redeclare package Medium = fluid1, V = 0.01, nPorts = 2, use_portsData = false, use_HeatTransfer = true) annotation(
    Placement(transformation(origin = {346, 264}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Fluid.Machines.ControlledPump Cmp010(redeclare package Medium = fluid1, control_m_flow = false, redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 1), m_flow_nominal = 1, p_a_nominal = 1e5, p_b_nominal = 1e6, use_p_set = true, p_a_start(displayUnit = "Pa") = 1, p_b_start(displayUnit = "Pa") = 1, T_start(displayUnit = "degC") = 288.15, checkValve = true, N_nominal = 1000, allowFlowReversal = false, V = 0.1, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(transformation(origin = {346, 243}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume Vol000(redeclare package Medium = fluid1, V = 0.1, nPorts = 2, use_portsData = false) annotation(
    Placement(transformation(origin = {346, 187}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {346, 226}, extent = {{3, 3}, {-3, -3}}, rotation = 270)));
  Modelica.Blocks.Continuous.PID PID(k = 500, Ti = 0.5, Td = 0.1, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(
    Placement(transformation(origin = {319, 264}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Math.Feedback feedback3 annotation(
    Placement(transformation(origin = {306, 264}, extent = {{-4, 4}, {4, -4}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Vol_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {346, 276}, extent = {{3, 3}, {-3, -3}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Q_flow_Cmp010 annotation(
    Placement(transformation(origin = {332, 264}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice dP041(redeclare package Medium = fluid1, diameter = 0.2, zeta = 1) annotation(
    Placement(transformation(origin = {264, 126}, extent = {{-8, -8}, {8, 8}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Cmp010_in(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {377, 215}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const3(k = 273.15) annotation(
    Placement(transformation(origin = {357, 221}, extent = {{-2, -2}, {2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback4 annotation(
    Placement(transformation(origin = {357, 215}, extent = {{2, -2}, {-2, 2}}, rotation = -180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {346, 215}, extent = {{-3, 3}, {3, -3}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_out1(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {327, 204}, extent = {{8, -5}, {-8, 5}})));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Cmp010_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {346, 204}, extent = {{3, 3}, {-3, -3}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_ph boundary(nPorts = 1, redeclare package Medium = fluid1, use_p_in = true, use_h_in = true) annotation(
    Placement(transformation(origin = {346, 162}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.SpecificEnthalpyTwoPort h_HX041_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {296, 126}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(redeclare package Medium = fluid1, nPorts = 1, use_h_in = false, use_p_in = true) annotation(
    Placement(transformation(origin = {320, 126}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain gain4(k = 100*1000) annotation(
    Placement(transformation(origin = {371, 248}, extent = {{4, -4}, {-4, 4}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Vol_Cmp010_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {377, 289}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Constant const31(k = 273.15) annotation(
    Placement(transformation(origin = {357, 295}, extent = {{-2, -2}, {2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback41 annotation(
    Placement(transformation(origin = {357, 289}, extent = {{2, -2}, {-2, 2}}, rotation = -180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Vol_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {346, 289}, extent = {{-3, 3}, {3, -3}}, rotation = 90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_HX020_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {258, 298}, extent = {{3, 3}, {-3, -3}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX020_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {248, 298}, extent = {{-3, -3}, {3, 3}}, rotation = 180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_HX040_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {172, 126}, extent = {{3, 3}, {-3, -3}}, rotation = 180)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX040_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {162, 126}, extent = {{-3, -3}, {3, 3}})));
  FluidSystemComponents.Sensor.MassFractionsArrayTwoPort XiArr_HX020_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {269, 298}, extent = {{3, 3}, {-3, -3}})));
  FluidSystemComponents.Sensor.MassFractionsArrayTwoPort XiArr_HX040_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {152, 126}, extent = {{3, 3}, {-3, -3}}, rotation = 180)));
  FluidSystemComponents.Utilities.arr_Ts_const_p_00 curve_Ts_HX020(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {54, 98}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = s_HX020_in.s) annotation(
    Placement(transformation(origin = {13, 102}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = s_HX020_out.s) annotation(
    Placement(transformation(origin = {31, 106}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = p_HX020_out.p) annotation(
    Placement(transformation(origin = {13, 94}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Blocks.Sources.RealExpression realExpression3[0](y = XiArr_HX020_in.Xi) annotation(
    Placement(transformation(origin = {31, 90}, extent = {{-7, -4}, {7, 4}})));
  FluidSystemComponents.Utilities.arr_Ts_const_p_00 curve_Ts_HX040(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {54, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y = s_HX040_in.s) annotation(
    Placement(transformation(origin = {13, 64}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y = s_HX040_out.s) annotation(
    Placement(transformation(origin = {31, 68}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y = p_HX040_out.p) annotation(
    Placement(transformation(origin = {13, 56}, extent = {{-7, -4}, {7, 4}})));
  Modelica.Blocks.Sources.RealExpression realExpression7[0](y = XiArr_HX040_in.Xi) annotation(
    Placement(transformation(origin = {31, 52}, extent = {{-7, -4}, {7, 4}})));
equation
//
  Arr_s[1] = s_Cmp010_in.s;
  Arr_s[2] = s_Vol_Cmp010_out.s;
  Arr_s[3] = s_HX020_in.s;
  for i in 1:curve_Ts_HX020.nPts_par loop
    Arr_s[i + 3] = curve_Ts_HX020.arr_s[i];
  end for;
  Arr_s[4 + curve_Ts_HX020.nPts_par] = s_HX020_out.s;
  Arr_s[5 + curve_Ts_HX020.nPts_par] = s_Valve030_in.s;
  Arr_s[6 + curve_Ts_HX020.nPts_par] = s_Valve030_out.s;
  Arr_s[7 + curve_Ts_HX020.nPts_par] = s_HX040_in.s;
  for i in 1:curve_Ts_HX040.nPts_par loop
    Arr_s[i + 7 + curve_Ts_HX020.nPts_par] = curve_Ts_HX040.arr_s[i];
  end for;
  Arr_s[8 + curve_Ts_HX020.nPts_par + curve_Ts_HX040.nPts_par] = s_HX040_out.s;
  Arr_s[9 + curve_Ts_HX020.nPts_par + curve_Ts_HX040.nPts_par] = s_Cmp010_in.s;
//
  Arr_T[1] = T_Cmp010_in.T;
  Arr_T[2] = T_Vol_Cmp010_out.T;
  Arr_T[3] = T_HX020_in.T;
  for i in 1:curve_Ts_HX020.nPts_par loop
    Arr_T[i + 3] = curve_Ts_HX020.arr_T[i];
  end for;
  Arr_T[4 + curve_Ts_HX020.nPts_par] = T_HX020_out.T;
  Arr_T[5 + curve_Ts_HX020.nPts_par] = T_Valve030_in.T;
  Arr_T[6 + curve_Ts_HX020.nPts_par] = T_Valve030_out.T;
  Arr_T[7 + curve_Ts_HX020.nPts_par] = T_HX040_in.T;
  for i in 1:curve_Ts_HX040.nPts_par loop
    Arr_T[i + 7 + curve_Ts_HX040.nPts_par] = curve_Ts_HX040.arr_T[i];
  end for;
  Arr_T[8 + curve_Ts_HX020.nPts_par + curve_Ts_HX040.nPts_par] = T_HX040_out.T;
  Arr_T[9 + curve_Ts_HX020.nPts_par + curve_Ts_HX040.nPts_par] = T_Cmp010_in.T;
/*  */
//
  connect(ramp_Valve030_open.y, Valve030.opening) annotation(
    Line(points = {{96.5, 211}, {108, 211}}, color = {0, 0, 127}));
  connect(const.y, feedback.u2) annotation(
    Line(points = {{107, 172.8}, {107, 170.8}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_out.numberPort, feedback.y) annotation(
    Line(points = {{99.65, 169}, {104.65, 169}}, color = {0, 0, 127}));
  connect(const1.y, feedback1.u2) annotation(
    Line(points = {{106, 245.2}, {106, 247.2}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_in.numberPort, feedback1.y) annotation(
    Line(points = {{97.65, 249}, {103.3, 249}}, color = {0, 0, 127}));
  connect(s_Valve030_in.port_b, T_Valve030_in.port_a) annotation(
    Line(points = {{118, 258.5}, {118, 252}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Valve030_in.T, feedback1.u1) annotation(
    Line(points = {{114.7, 249}, {108, 249}}, color = {0, 0, 127}));
  connect(rho_Valve030_in.d, realValue_rho_Valve030_in.numberPort) annotation(
    Line(points = {{121.3, 237}, {127.3, 237}}, color = {0, 0, 127}));
  connect(T_Valve030_in.port_b, rho_Valve030_in.port_a) annotation(
    Line(points = {{118, 246}, {118, 240}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_in.port_b, Valve030.port_a) annotation(
    Line(points = {{118, 234}, {118, 224}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Valve030_out.T, feedback.u1) annotation(
    Line(points = {{114.7, 169}, {108.7, 169}}, color = {0, 0, 127}));
  connect(T_Valve030_out.port_b, s_Valve030_out.port_a) annotation(
    Line(points = {{118, 166}, {118, 159}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_out.d, realValue_rho_Valve030_out.numberPort) annotation(
    Line(points = {{121.3, 182}, {128.3, 182}}, color = {0, 0, 127}));
  connect(Valve030.port_b, rho_Valve030_out.port_a) annotation(
    Line(points = {{118, 198}, {118, 185}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_out.port_b, T_Valve030_out.port_a) annotation(
    Line(points = {{118, 179}, {118, 172}}, color = {0, 127, 255}, thickness = 2));
  connect(Vol030.ports[1], s_Valve030_in.port_a) annotation(
    Line(points = {{118, 272}, {118, 264.5}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Valve030_out.port_b, Vol031.ports[1]) annotation(
    Line(points = {{118, 153}, {118, 132}}, color = {0, 127, 255}, thickness = 2));
  connect(dP031.port_a, Vol031.ports[2]) annotation(
    Line(points = {{124, 126}, {118, 126}, {118, 132}}, color = {0, 127, 255}, thickness = 2));
  connect(dP021.port_b, Vol030.ports[2]) annotation(
    Line(points = {{126, 298}, {118, 298}, {118, 272}}, color = {0, 127, 255}, thickness = 2));
  connect(gain1.y, realValue_Q_flow_HX020.numberPort) annotation(
    Line(points = {{206.3, 361}, {215, 361}}, color = {0, 0, 127}));
  connect(T_hot.port, Q_flow_HX020.port_b) annotation(
    Line(points = {{136, 344}, {146, 344}}, color = {191, 0, 0}, thickness = 2));
  connect(Q_flow_HX020.port_a, conv_HX020.fluid) annotation(
    Line(points = {{154, 344}, {160, 344}}, color = {191, 0, 0}, thickness = 2));
  connect(ramp_HX030_hconv.y, conv_HX020.Gc) annotation(
    Line(points = {{170, 327.4}, {170, 334.8}}, color = {0, 0, 127}));
  connect(gain1.u, Q_flow_HX020.Q_flow) annotation(
    Line(points = {{199, 361}, {150.6, 361}, {150.6, 348}, {150, 348}}, color = {0, 0, 127}));
  connect(cond_HX020.port_a, HX020.heatPort) annotation(
    Line(points = {{212, 344}, {219, 344}, {219, 310}}, color = {191, 0, 0}, thickness = 2));
  connect(CpHX020.port, cond_HX020.port_b) annotation(
    Line(points = {{191, 344}, {201, 344}}, color = {191, 0, 0}, thickness = 2));
  connect(conv_HX020.solid, CpHX020.port) annotation(
    Line(points = {{180, 344}, {191, 344}}, color = {191, 0, 0}, thickness = 2));
  connect(dP011.port_a, m_flow_Cmp010_out.port_b) annotation(
    Line(points = {{296, 298}, {307, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(T_HX020_out.port_a, HX020.ports[1]) annotation(
    Line(points = {{213, 298}, {232, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(s_HX020_out.port_a, T_HX020_out.port_b) annotation(
    Line(points = {{203, 298}, {207, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(const2.y, feedback2.u2) annotation(
    Line(points = {{206, 283.2}, {206, 285.2}}, color = {0, 0, 127}));
  connect(realValue_T_HX020_out.numberPort, feedback2.y) annotation(
    Line(points = {{197.65, 287}, {203.65, 287}}, color = {0, 0, 127}));
  connect(feedback2.u1, T_HX020_out.T) annotation(
    Line(points = {{207.6, 287}, {209.6, 287}, {209.6, 295}}, color = {0, 0, 127}));
  connect(dP021.port_a, s_HX020_out.port_b) annotation(
    Line(points = {{142, 298}, {197, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(HX020.ports[2], p_HX020_out.port) annotation(
    Line(points = {{231, 298}, {222, 298}, {222, 276}}, color = {0, 127, 255}));
  connect(gain.u, p_HX020_out.p) annotation(
    Line(points = {{217.4, 273}, {220.4, 273}}, color = {0, 0, 127}));
  connect(realValue_p_HX020_out.numberPort, gain.y) annotation(
    Line(points = {{207.65, 273}, {212.65, 273}}, color = {0, 0, 127}));
  connect(const21.y, feedback21.u2) annotation(
    Line(points = {{208, 105.2}, {208, 107.4}}, color = {0, 0, 127}));
  connect(realValue_T_HX020_out1.numberPort, feedback21.y) annotation(
    Line(points = {{220.35, 109}, {210, 109}}, color = {0, 0, 127}));
  connect(feedback21.u1, T_HX040_out.T) annotation(
    Line(points = {{206.4, 109}, {206.4, 123}}, color = {0, 0, 127}));
  connect(HX040.ports[1], T_HX040_out.port_a) annotation(
    Line(points = {{187, 126}, {203, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(gain2.u, p_HX040_out.p) annotation(
    Line(points = {{193.4, 147}, {196, 147}}, color = {0, 0, 127}));
  connect(realValue_p_HX040_out.numberPort, gain2.y) annotation(
    Line(points = {{183.65, 147}, {188.65, 147}}, color = {0, 0, 127}));
  connect(HX040.ports[2], p_HX040_out.port) annotation(
    Line(points = {{187, 126}, {199, 126}, {199, 144}}, color = {0, 127, 255}));
  connect(realValue_rho_HX040_out.numberPort, rho_HX040_out.d) annotation(
    Line(points = {{208.2, 160}, {218.2, 160}, {218.2, 129}}, color = {0, 0, 127}));
  connect(gain3.y, realValue_Q_flow_HX040.numberPort) annotation(
    Line(points = {{138.3, 97}, {143.6, 97}}, color = {0, 0, 127}));
  connect(ramp_HX040_hconv.y, conv_HX040.Gc) annotation(
    Line(points = {{146, 51.4}, {146, 58.8}}, color = {0, 0, 127}));
  connect(gain3.u, Q_flow_HX040.Q_flow) annotation(
    Line(points = {{131.4, 97}, {125.4, 97}, {125.4, 72}}, color = {0, 0, 127}));
  connect(conv_HX040.solid, CpHX040.port) annotation(
    Line(points = {{156, 68}, {169, 68}}, color = {191, 0, 0}, thickness = 2));
  connect(T_cold.port, Q_flow_HX040.port_a) annotation(
    Line(points = {{112, 68}, {121, 68}}, color = {191, 0, 0}, thickness = 2));
  connect(Q_flow_HX040.port_b, conv_HX040.fluid) annotation(
    Line(points = {{129, 68}, {136, 68}}, color = {191, 0, 0}, thickness = 2));
  connect(CpHX040.port, cond_HX040.port_a) annotation(
    Line(points = {{169, 68}, {179, 68}}, color = {191, 0, 0}, thickness = 2));
  connect(cond_HX040.port_b, HX040.heatPort) annotation(
    Line(points = {{190, 68}, {199, 68}, {199, 114}}, color = {191, 0, 0}, thickness = 2));
  connect(realValue_m_flow_Cmp010_out.numberPort, m_flow_Cmp010_out.m_flow) annotation(
    Line(points = {{320.35, 325}, {312, 325}, {312, 303.5}}, color = {0, 0, 127}));
  connect(Cmp010.port_b, Vol_Cmp010_out.ports[1]) annotation(
    Line(points = {{346, 253}, {346, 259}}, color = {0, 127, 255}, thickness = 2));
  connect(T_HX040_out.port_b, rho_HX040_out.port_a) annotation(
    Line(points = {{209, 126}, {215, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_HX040_out.port_b, s_HX040_out.port_a) annotation(
    Line(points = {{221, 126}, {225, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(Cmp010.port_a, s_Cmp010_in.port_b) annotation(
    Line(points = {{346, 233}, {346, 228}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Vol_Cmp010_out.port_a, Vol_Cmp010_out.ports[2]) annotation(
    Line(points = {{346, 273}, {346, 260}}, color = {0, 127, 255}, thickness = 2));
  connect(feedback3.y, PID.u) annotation(
    Line(points = {{309.6, 264}, {313, 264}}, color = {0, 0, 127}));
  connect(s_Cmp010_in.s, feedback3.u1) annotation(
    Line(points = {{342.7, 226}, {303.7, 226}, {303.7, 264}}, color = {0, 0, 127}));
  connect(PID.y, Q_flow_Cmp010.Q_flow) annotation(
    Line(points = {{324.5, 264}, {328, 264}}, color = {0, 0, 127}));
  connect(s_Vol_Cmp010_out.s, feedback3.u2) annotation(
    Line(points = {{342.7, 276}, {305.7, 276}, {305.7, 267}}, color = {0, 0, 127}));
  connect(Q_flow_Cmp010.port, Vol_Cmp010_out.heatPort) annotation(
    Line(points = {{336, 264}, {342, 264}}, color = {191, 0, 0}, thickness = 0.5));
  connect(const3.y, feedback4.u2) annotation(
    Line(points = {{357, 218.8}, {357, 217}}, color = {0, 0, 127}));
  connect(realValue_T_Cmp010_in.numberPort, feedback4.y) annotation(
    Line(points = {{364.35, 215}, {359.35, 215}}, color = {0, 0, 127}));
  connect(T_Cmp010_in.T, feedback4.u1) annotation(
    Line(points = {{349.3, 215}, {355, 215}}, color = {0, 0, 127}));
  connect(T_Cmp010_in.port_b, s_Cmp010_in.port_a) annotation(
    Line(points = {{346, 218}, {346, 224}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Cmp010_in.d, realValue_rho_Valve030_out1.numberPort) annotation(
    Line(points = {{342.7, 204}, {335.7, 204}}, color = {0, 0, 127}));
  connect(rho_Cmp010_in.port_b, T_Cmp010_in.port_a) annotation(
    Line(points = {{346, 207}, {346, 212}}, color = {0, 127, 255}, thickness = 2));
  connect(Vol000.ports[1], rho_Cmp010_in.port_a) annotation(
    Line(points = {{346, 180}, {346, 201}}, color = {0, 127, 255}, thickness = 2));
  connect(boundary.ports[1], Vol000.ports[2]) annotation(
    Line(points = {{346, 172}, {346, 180}}, color = {0, 127, 255}, thickness = 2));
  connect(boundary1.p_in, ramp_p1.y) annotation(
    Line(points = {{332, 134}, {361, 134}}, color = {0, 0, 127}));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{360.6, 134}, {336.6, 134}, {336.6, 150}, {337.6, 150}}, color = {0, 0, 127}));
  connect(h_HX041_out.h_out, boundary.h_in) annotation(
    Line(points = {{296, 129.3}, {296, 142.3}, {342, 142.3}, {342, 150.3}}, color = {0, 0, 127}, thickness = 2));
  connect(gain4.y, Cmp010.p_set) annotation(
    Line(points = {{366.6, 248}, {354.6, 248}}, color = {0, 0, 127}));
  connect(gain4.u, ramp_Cmp010_PR.y) annotation(
    Line(points = {{375.8, 248}, {385.8, 248}}, color = {0, 0, 127}));
  connect(const31.y, feedback41.u2) annotation(
    Line(points = {{357, 292.8}, {357, 291}}, color = {0, 0, 127}));
  connect(realValue_T_Vol_Cmp010_out.numberPort, feedback41.y) annotation(
    Line(points = {{364.35, 289}, {359.35, 289}}, color = {0, 0, 127}));
  connect(T_Vol_Cmp010_out.T, feedback41.u1) annotation(
    Line(points = {{349.3, 289}, {355.3, 289}}, color = {0, 0, 127}));
  connect(m_flow_Cmp010_out.port_a, T_Vol_Cmp010_out.port_b) annotation(
    Line(points = {{317, 298}, {346, 298}, {346, 292}}, color = {0, 127, 255}, thickness = 2));
  connect(s_Vol_Cmp010_out.port_b, T_Vol_Cmp010_out.port_a) annotation(
    Line(points = {{346, 279}, {346, 285}}, color = {0, 127, 255}, thickness = 2));
  connect(HX020.ports[3], s_HX020_in.port_b) annotation(
    Line(points = {{231, 298}, {244, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(s_HX020_in.port_a, T_HX020_in.port_b) annotation(
    Line(points = {{251, 298}, {255, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(s_HX040_in.port_b, T_HX040_in.port_a) annotation(
    Line(points = {{165, 126}, {169, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(T_HX040_in.port_b, HX040.ports[3]) annotation(
    Line(points = {{175, 126}, {188, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(dP041.port_a, s_HX040_out.port_b) annotation(
    Line(points = {{256, 126}, {232, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(dP041.port_b, h_HX041_out.port_a) annotation(
    Line(points = {{272, 126}, {293, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(h_HX041_out.port_b, boundary1.ports[1]) annotation(
    Line(points = {{299, 126}, {310, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(T_HX020_in.port_a, XiArr_HX020_in.port_b) annotation(
    Line(points = {{261, 298}, {266, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(XiArr_HX020_in.port_a, dP011.port_b) annotation(
    Line(points = {{272, 298}, {280, 298}}, color = {0, 127, 255}, thickness = 2));
  connect(XiArr_HX040_in.port_b, s_HX040_in.port_a) annotation(
    Line(points = {{155, 126}, {159, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(dP031.port_b, XiArr_HX040_in.port_a) annotation(
    Line(points = {{140, 126}, {149, 126}}, color = {0, 127, 255}, thickness = 2));
  connect(realExpression2.y, curve_Ts_HX020.u_p) annotation(
    Line(points = {{20.7, 94}, {42.4, 94}}, color = {0, 0, 127}));
  connect(realExpression3.y, curve_Ts_HX020.u_Xi) annotation(
    Line(points = {{38.7, 90}, {42.7, 90}}, color = {0, 0, 127}, thickness = 0.5));
  connect(realExpression6.y, curve_Ts_HX040.u_p) annotation(
    Line(points = {{20.7, 56}, {42.7, 56}}, color = {0, 0, 127}));
  connect(realExpression7.y, curve_Ts_HX040.u_Xi) annotation(
    Line(points = {{38.7, 52}, {43, 52}}, color = {0, 0, 127}, thickness = 0.5));
  connect(realExpression4.y, curve_Ts_HX040.u_sLower) annotation(
    Line(points = {{20.7, 64}, {42.7, 64}}, color = {0, 0, 127}));
  connect(realExpression5.y, curve_Ts_HX040.u_sUpper) annotation(
    Line(points = {{38.7, 68}, {42.7, 68}}, color = {0, 0, 127}));
  connect(realExpression1.y, curve_Ts_HX020.u_sUpper) annotation(
    Line(points = {{38, 106}, {44, 106}}, color = {0, 0, 127}));
  connect(realExpression.y, curve_Ts_HX020.u_sLower) annotation(
    Line(points = {{20, 102}, {44, 102}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.1.0")),
    Diagram(coordinateSystem(extent = {{0, 380}, {400, 0}}), graphics = {Text(origin = {95, 164}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {93, 243}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {142, 178}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {142, 233}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {343, 319}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/s]", horizontalAlignment = TextAlignment.Left), Text(origin = {253, 360}, extent = {{-7, 5}, {7, -5}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left), Text(origin = {193, 281}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {209, 267}, extent = {{-5, 2}, {5, -2}}, textString = "[kPa]", horizontalAlignment = TextAlignment.Left), Text(origin = {243, 103}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {185, 141}, extent = {{-5, 2}, {5, -2}}, textString = "[kPa]", horizontalAlignment = TextAlignment.Left), Text(origin = {204, 156}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {164, 91}, extent = {{-4, 2}, {4, -2}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left), Text(origin = {332, 200}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {385, 210}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {385, 284}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Line(origin = {237, 346}, points = {{-9, -18}, {-9, 0}}, color = {224, 27, 36}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 4)}),
    version = "",
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end RefrigCycleMachine_R134_ex04;