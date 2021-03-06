require 'spec_helper'

describe 'glance::db::postgresql' do

  let :req_params do
    { :password => 'pw' }
  end

  let :pre_condition do
    'include postgresql::server'
  end

  context 'on a RedHat osfamily' do
    let :facts do
      {
        :osfamily                 => 'RedHat',
        :operatingsystemrelease   => '7.0',
        :concat_basedir => '/var/lib/puppet/concat'
      }
    end

    context 'with only required parameters' do
      let :params do
        req_params
      end

      it { should contain_postgresql__server__db('glance').with(
        :user     => 'glance',
        :password => 'md56c7c03b193c2c1e0667bc5bd891703db'
      )}
    end

  end

  context 'on a Debian osfamily' do
    let :facts do
      {
        :operatingsystemrelease => '7.8',
        :operatingsystem        => 'Debian',
        :osfamily               => 'Debian',
        :concat_basedir => '/var/lib/puppet/concat'
      }
    end

    context 'with only required parameters' do
      let :params do
        req_params
      end

      it { should contain_postgresql__server__db('glance').with(
        :user     => 'glance',
        :password => 'md56c7c03b193c2c1e0667bc5bd891703db'
      )}
    end

  end

end
