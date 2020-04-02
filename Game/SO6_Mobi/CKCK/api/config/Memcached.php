<?php
class Memcached
{
	function __construct($p_host="memcached",$p_port="11211")
	{
		$this->memcache = new Memcache();
		$this->memcache->pconnect($p_host, $p_port);
	}
	function set($p_key,$p_array,$p_time)
	{
		return $this->memcache->set($p_key,$p_array,0,$p_time);
	}
	function get($p_key)
	{
		return $this->memcache->get($p_key);
	}
	function replace($p_key,$p_array,$p_time)
	{
		return $this->memcache->replace($p_key,$p_array,false,$p_time);
	}
	function delete($p_key)
	{
		return $this->memcache->delete($p_key);
	}
	function __destruct()
	{
		memcache_close($this->memcache);
	}
}
?>