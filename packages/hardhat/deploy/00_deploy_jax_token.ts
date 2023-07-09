import { DeployFunction } from "hardhat-deploy/types";
import { HardhatRuntimeEnvironment } from "hardhat/types";

/**
 * Deploys a contract named "JaxToken" using the deployer account and
 * constructor arguments set to the deployer address
 *
 * @param hre HardhatRuntimeEnvironment object.
 */
const deployJaxToken: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts();
  const { deploy } = hre.deployments;

  await deploy("JaxToken", {
    from: deployer,
    args: ["0xE849b2a694184B8739a04C915518330757cDB18B"],
    log: true,
    autoMine: true,
  });

  // Get the deployed contract
  // const JaxToken = await hre.ethers.getContract("JaxToken", deployer);
};

export default deployJaxToken;

// Tags are useful if you have multiple deploy files and only want to run one of them.
// e.g. yarn deploy --tags JaxToken
deployJaxToken.tags = ["JaxToken"];
