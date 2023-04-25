<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png?sanitize=true" width=350/>
		<br />
		<a href="https://aws.amazon.com"><img src="https://img.shields.io/badge/-deployed-blank.svg?style=social&logo=amazon"></a>
		<br />
		<h3>lab-iam-profiles</h3>
		</a> <a href="https://app.circleci.com/pipelines/github/ThoughtWorks-DPS/cohort-base-platform-vpc"><img src="https://circleci.com/gh/ThoughtWorks-DPS/cohort-base-platform-vpc.svg?style=shield"></a>
		<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/github/license/ThoughtWorks-DPS/circleci-remote-docker"></a>
	</p>
</div>

Strive to create a simple transit routed network. In this way, individual internal AWS account holders can self manage their own account network topologies and connect to other enterprise addresses by connecting to the appropriate transit gateway (which can be configured to auto-accept connections from corporate AWS accounts).

The platform starter kit repo deals only with the platform instance network routes.

```
| vpc      | region          | az              | az             | az             |
|----------|:---------------:|:------------ --:|:--------------:|---------------:|
|          |                 |                 |                |                |
| dps-2    | us-east-2       | us-east-2a      |   us-east-2b   |  us-east-2c    |
| sandbox  | 10.50.0.0/16    |                 |                |                |
| private  |                 | 10.50.0.0/19    | 10.50.32.0/19  | 10.50.64.0/19  |
| public   |                 | 10.50.96.0/24   | 10.50.97.0/24  | 10.50.98.0/24  |
| intra    |                 | 10.50.100.0/23  | 10.50.102.0/23 | 10.50.104.0/23 |
| database |                 | 10.50.106.0/23  | 10.50.108.0/23 | 10.50.110.0/23 |
|          |                 |                 |                |                |
| dps-1    | us-east-1       | us-east-1a      |   us-east-1b   |  us-east-1c    |
| prod     | 10.60.0.0/16    |                 |                |                |
| private  |                 | 10.60.0.0/19    | 10.60.32.0/19  | 10.60.64.0/19  |
| public   |                 | 10.60.96.0/24   | 10.60.97.0/24  | 10.60.98.0/24  |
| intra    |                 | 10.60.100.0/23  | 10.60.102.0/23 | 10.60.104.0/23 |
| database |                 | 10.60.106.0/23  | 10.60.108.0/23 | 10.60.110.0/23 |

*RESERVED*

| vpc      | region          | az              | az             | az             |
|----------|:---------------:|:------------ --:|:--------------:|---------------:|
|          |                 |                 |                |                |
| dps-2    | us-east-2       | us-east-2a      |   us-east-2b   |  us-east-2c    |
| preview  | 10.51.0.0/16    |                 |                |                |
| private  |                 | 10.51.0.0/19    | 10.51.32.0/19  | 10.51.64.0/19  |
| public   |                 | 10.51.96.0/24   | 10.51.97.0/24  | 10.51.98.0/24  |
| intra    |                 | 10.51.100.0/23  | 10.51.102.0/23 | 10.51.104.0/23 |
|          |                 |                 |                |                |
| dps-2    | us-east-2       | us-east-2a      |   us-east-2b   |  us-east-2c    |
| nonprod  | 10.55.0.0/16    |                 |                |                |
| private  |                 | 10.55.0.0/19    | 10.55.32.0/19  | 10.55.64.0/19  |
| public   |                 | 10.55.96.0/24   | 10.55.97.0/24  | 10.55.98.0/24  |
| intra    |                 | 10.55.100.0/23  | 10.55.102.0/23 | 10.55.104.0/23 |
|          |                 |                 |                |                |
| dps-1    | us-east-1       | us-east-1a      |   us-east-1b   |  us-east-1c    |
| mapi     | 10.64.0.0/16    |                 |                |                |
| private  |                 | 10.64.0.0/19    | 10.64.32.0/19  | 10.64.64.0/19  |
| public   |                 | 10.64.96.0/24   | 10.64.97.0/24  | 10.64.98.0/24  |
| intra    |                 | 10.64.100.0/23  | 10.64.102.0/23 | 10.64.104.0/23 |


| subnet  | routes                         |
|---------|--------------------------------|
| public  | local, igw                     |
| private | local, natgw-public-us-east-1a |
| intra   | local                          |
```

#### vpc-flow-logs

Uncomment section in main.tf to generate vpc-flow-logs.
